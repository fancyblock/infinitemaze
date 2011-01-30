package Stage 
{
	import Define.GameDefine;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.Timer;
	import Manager.MasterManager;
	import Manager.MoverHolderManager;
	import Maze.MazeGenerator;
	import Maze.SubMaze;
	import Mover.Demon;
	import Mover.DemonHolder;
	import Mover.Hero;
	import Mover.HeroHolder;
	import Mover.Human;
	import Mover.HumanHolder;

	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011/1/28 20:52
	 */
	public class GameStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
		
		static private var HeroRegion:Rectangle = new Rectangle( 200, 200, 200, 200 );
		
		//-------------------------------- private member -----------------------------------
		
		//ui
		private var m_gameContainer:Sprite = null;
		private var m_txtEvilCnt:TextField = null;
		private var m_txtFreeMan:TextField = null;
		private var m_txtYourMan:TextField = null;
		private var m_txtEvilMan:TextField = null;
		private var m_txtCountdown:TextField = null;
		private var m_mcFightDlg:MovieClip = null;
		
		private var m_canva:Sprite = null;
		private var m_moverCanva:Sprite = null;
		private var m_map:Sprite = null;
		private var m_knowMap:Bitmap = null;
		private var m_knowMapData:BitmapData = null;
		private var m_mapMask:Sprite = null;
		private var m_moverMask:Sprite = null;
		
		private var m_maze:SubMaze = null;
		private var m_hero:Hero = null;
		private var m_humans:Array = null;
		private var m_demons:Array = null;
		
		private var m_timer:Timer = null;
		private var m_countdown:int = 0;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of GameStage
		 */
		public function GameStage() 
		{
			super( "../assets/GameStageBG.png" );
			
			//set the ui bgm
			this.UI_BGM = "../assets/Sound/BGM/GameBgm.mp3";
			
			//load the ui
			this.embedUI( new GameStageUI() );
		}
		
		/**
		 * @desc	frame func
		 * @param	delta
		 */
		override public function onFrame (delta:Number) : void
		{
			super.onFrame( delta );
			
			//update mover
			MoverHolderManager.Singleton.Update();
			
			updateVisibleArea();
			updateMapOffset();
			updateUI();
			stateJudge();
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void
		{
			addChild( UI_ROOT );
			
			m_gameContainer = UI_ROOT.getChildByName( "mcGameCanva" ) as Sprite;
			m_txtEvilCnt = UI_ROOT.getChildByName( "txtEvilCnt" ) as TextField;
			m_txtFreeMan = UI_ROOT.getChildByName( "txtFreeMan" ) as TextField;
			m_txtYourMan = UI_ROOT.getChildByName( "txtYourMan" ) as TextField;
			m_txtEvilMan = UI_ROOT.getChildByName( "txtEvilMan" ) as TextField;
			m_txtCountdown = UI_ROOT.getChildByName( "txtCountdown" ) as TextField;
			m_mcFightDlg = UI_ROOT.getChildByName( "mcFightAni" ) as MovieClip;
		}
		
		//enter this stage
		override protected function onEnter():void
		{
			initialCanva();
			
			createMaze();
			createHumans();
			createDemon();
			createHero();
			
			createVisibleArea();
			createKnowMap();
			
			initlalUI();
			start();
		}
		
		//leave this stage
		override protected function onLeave():void
		{
			m_gameContainer.removeChild( m_canva );
		}
		
		//create the canva
		private function initialCanva():void
		{
			m_canva = new Sprite();
			m_moverCanva = new Sprite();
			m_map = new Sprite();
			m_knowMap = new Bitmap();
			
			m_gameContainer.addChild( m_canva );	m_canva.x = 100, m_canva.y = -177;
			m_canva.addChild( m_map );
			m_canva.addChild( m_knowMap );
			m_canva.addChild( m_moverCanva );
		}
		
		//create the maze
		private function createMaze():void
		{
			m_maze = new SubMaze();
			m_maze.Create( GameDefine.MAZE_WIDTH, GameDefine.MAZE_HEIGHT, GameDefine.MAZE_GRID_SIZE, GameDefine.MAZE_GRID_SIZE );
			MazeGenerator.GenRandomMaze( m_maze );
			var mapData:Bitmap = MazeRender.DrawMaze( m_maze );
			
			m_map.addChild( mapData );
		}
		
		//create the hero
		private function createHero():void
		{
			m_hero = new Hero( HeroAni );
			var heroHolder:HeroHolder = new HeroHolder();
			
			heroHolder.AttachMover( m_hero );
			heroHolder.AttachSpace( m_maze );
			MoverHolderManager.Singleton.AddHolder( heroHolder );
			MasterManager.Singleton.AddMaster( m_hero, true );
			
			m_moverCanva.addChild( m_hero );
		}
		
		//create all the humans
		private function createHumans():void
		{
			m_humans = new Array();
			
			var human:Human = null;
			var humanController:HumanHolder = null;
			for ( var i:int = 0; i < GameDefine.HumanCount; i++ )
			{
				human = new Human( HumanAni, new Point( int( GameDefine.MAZE_WIDTH * Math.random() ) * GameDefine.MAZE_GRID_SIZE + GameDefine.MAZE_GRID_SIZE * 0.5,
														int( GameDefine.MAZE_HEIGHT * Math.random() ) * GameDefine.MAZE_GRID_SIZE + GameDefine.MAZE_GRID_SIZE * 0.5 ) );
														
				humanController = new HumanHolder();
				humanController.AttachMover( human );
				humanController.AttachSpace( m_maze );
				MoverHolderManager.Singleton.AddHolder( humanController );
				
				m_moverCanva.addChild( human );
			}
		}
		
		//create all the demon
		private function createDemon():void
		{
			m_demons = new Array();
			
			var demon:Demon = null;
			var demonController:DemonHolder = null;
			for ( var i:int = 0; i < GameDefine.DemonCount; i++ )
			{
				demon = new Demon( DemonAni, new Point( int( GameDefine.MAZE_WIDTH * Math.random() ) * GameDefine.MAZE_GRID_SIZE + GameDefine.MAZE_GRID_SIZE * 0.5,
														int( GameDefine.MAZE_HEIGHT * Math.random() ) * GameDefine.MAZE_GRID_SIZE + GameDefine.MAZE_GRID_SIZE * 0.5 ) );
				
				demonController = new DemonHolder();
				demonController.AttachMover( demon );
				demonController.AttachSpace( m_maze );
				MoverHolderManager.Singleton.AddHolder( demonController );
				MasterManager.Singleton.AddMaster( demon );
				
				m_moverCanva.addChild( demon );
			}
		}
		
		//create a visible area
		private function createVisibleArea():void
		{
			m_mapMask = new VisibleArea();
			m_moverMask = new VisibleArea();
			
			m_map.addChild( m_mapMask );
			( m_map.getChildAt( 0 ) as Bitmap ).mask = m_mapMask;
			
			m_moverCanva.mask = m_moverMask;
			m_canva.addChild( m_moverMask );
		}
		
		//create know map
		private function createKnowMap():void
		{
			m_knowMapData = new BitmapData( GameDefine.MAZE_WIDTH * GameDefine.MAZE_GRID_SIZE + 10, GameDefine.MAZE_HEIGHT * GameDefine.MAZE_GRID_SIZE + 10, true, 0x00000000 );
			m_knowMap.bitmapData = m_knowMapData;
			m_knowMap.alpha = 0.35;
		}
		
		//update the visible area
		private function updateVisibleArea():void
		{
			m_mapMask.x = m_hero.x;
			m_mapMask.y = m_hero.y;
			
			m_moverMask.x = m_hero.x;
			m_moverMask.y = m_hero.y;
			
			m_knowMapData.draw( m_map );
			m_knowMap.bitmapData = m_knowMapData;
			
			m_mapMask.width = 150 + m_hero.SlaveCount() * 12;
			m_mapMask.height = 150 + m_hero.SlaveCount() * 12;
			
			m_moverMask.width = m_mapMask.width;
			m_moverMask.height = m_mapMask.width;
		}
		
		//update the map offset
		private function updateMapOffset():void
		{
			var pt:Point = m_hero.localToGlobal( new Point() );
			
			if ( pt.x < HeroRegion.left )
			{
				moveCanva( HeroRegion.left - pt.x, 0 );
			}
			
			if ( pt.x > HeroRegion.right )
			{
				moveCanva( HeroRegion.right - pt.x, 0 );
			}
			
			if ( pt.y < HeroRegion.top )
			{
				moveCanva( 0, HeroRegion.top - pt.y );
			}
			
			if ( pt.y > HeroRegion.bottom )
			{
				moveCanva( 0, HeroRegion.bottom - pt.y );
			}
		}
		
		//move canva
		private function moveCanva( offsetX:Number, offsetY:Number ):void
		{
			var newPosX:Number = m_canva.x + offsetX;
			var newPosY:Number = m_canva.y + offsetY;
			
			m_canva.x = newPosX;
			m_canva.y = newPosY;
		}
		
		//initial ui
		private function initlalUI():void
		{
			m_txtEvilCnt.text = GameDefine.DemonCount.toString();
			m_txtFreeMan.text = GameDefine.HumanCount.toString();
			m_txtYourMan.text = "0";
			m_txtEvilMan.text = "0";
			
			m_mcFightDlg.visible = false;
		}
		
		//start
		private function start():void
		{
			m_countdown = GameDefine.CountdownSec;
			
			GlobalWork.GameState = GameDefine.GameState_Peace;
			MoverHolderManager.Singleton.SetState( GameDefine.GameState_Peace );
			
			GlobalWork.EvilCnt = GameDefine.DemonCount;
			GlobalWork.FreeManCnt = GameDefine.HumanCount;
			GlobalWork.YourManCnt = 0;
			GlobalWork.EvilManCnt = 0;
			
			m_timer = new Timer( 1000, m_countdown );
			m_timer.addEventListener( TimerEvent.TIMER, _onTick );
			m_timer.addEventListener( TimerEvent.TIMER_COMPLETE, _onDoom );
			
			m_timer.start();
		}
		
		//update ui info
		private function updateUI():void
		{
			GlobalWork.FreeManCnt = GameDefine.HumanCount - GlobalWork.EvilManCnt - GlobalWork.YourManCnt;
			
			m_txtEvilCnt.text = GlobalWork.EvilCnt.toString();
			m_txtFreeMan.text = GlobalWork.FreeManCnt.toString();
			m_txtYourMan.text = GlobalWork.YourManCnt.toString();
			m_txtEvilMan.text = GlobalWork.EvilManCnt.toString();
		}
		
		//judge if win of lose
		private function stateJudge():void
		{
			//win
			if ( GlobalWork.EvilCnt == 0 )
			{
				GlobalWork.ResultInfo = "You Win";
				this.FadeOutToScreen( WindowEnum.EndScreen );
			}
			else
			{
				//[unfinished]
			}
		}
		
		//-------------------------------- callback function --------------------------------
		
		private function _onTick( evt:Event ):void
		{
			m_countdown--;
			m_txtCountdown.text = m_countdown.toString();
		}
		
		private function _onDoom( evt:Event ):void
		{
			m_timer.removeEventListener( TimerEvent.TIMER, _onTick );
			m_timer.removeEventListener( TimerEvent.TIMER_COMPLETE, _onDoom );
			
			m_txtCountdown.text = "Run !";
			
			GlobalWork.GameState = GameDefine.GameState_Fight;
			MoverHolderManager.Singleton.SetState( GameDefine.GameState_Fight );
			
			//[unfinished]
		}
		
	}

}