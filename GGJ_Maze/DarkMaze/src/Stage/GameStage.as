package Stage 
{
	import Define.DirectionDef;
	import Define.GameDefine;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import Manager.MasterManager;
	import Manager.MoverHolderManager;
	import Maze.MazeGenerator;
	import Maze.SubMaze;
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
		//[unfinished]
		
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
			
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void
		{
			addChild( UI_ROOT );
			
			m_gameContainer = UI_ROOT.getChildByName( "mcGameCanva" ) as Sprite;
			
			//[unfinished]
		}
		
		//enter this stage
		override protected function onEnter():void
		{
			initialCanva();
			
			createMaze();
			createHumans();
			createHero();
			
			createVisibleArea();
			createKnowMap();
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
			MasterManager.Singleton.AddMaster( m_hero );
			
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
			
			m_mapMask.width = 150 + m_hero.SlaveCount() * 10;
			m_mapMask.height = 150 + m_hero.SlaveCount() * 10;
			
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
		
		//-------------------------------- callback function --------------------------------
	}

}