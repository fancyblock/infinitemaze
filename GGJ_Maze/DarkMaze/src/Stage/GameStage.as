package Stage 
{
	import com.pblabs.engine.PBE;
	import com.pblabs.screens.BaseScreen;
	import data.Resource;
	import Define.GameDefine;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	import Manager.MoverHolderManager;
	import Maze.MazeGenerator;
	import Maze.SubMaze;
	import Mover.HeroHolder;
	import Mover.Human;
	import Mover.HumanHolder;
	import Mover.IMoverController;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011/1/28 20:52
	 */
	public class GameStage extends BaseScreen 
	{
		//------------------------------ static member -------------------------------------
		
		[Embed(source='../data/data.swf', symbol='obj')]
		static private var Shape:Class;
		
		//------------------------------ private member ------------------------------------
		
		private var m_canva:Sprite = null;
		private var m_moverCanva:Sprite = null;
		private var m_mazeCanva:Bitmap = null;
		private var m_mazeMask:Sprite = null;
		private var m_moverMask:Sprite = null;
		
		private var m_maze:SubMaze = null;
		private var m_actor:Human = null;
		private var m_humans:Array = null;
		private var m_evil:Array = null;
		private var m_actorHolder:IMoverController = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of GameStage
		 */
		public function GameStage() 
		{
			super();
		}
		
		/**
		 * @desc	frame func
		 * @param	delta
		 */
		override public function onFrame (delta:Number) : void
		{
			MoverHolderManager.Singleton.Update();
			
			m_moverMask.x = m_actor.x;
			m_moverMask.y = m_actor.y;
			
			updateArea();	//maze mask
			
			//[unfinished]
		}

		/**
		 * @desc	callback when hide
		 */
		override public function onHide () : void
		{
			//[unfinished]
		}

		/**
		 * @desc	callback when show
		 */
		override public function onShow () : void
		{
			//create the canva
			m_canva = new Sprite();
			m_moverCanva = new Sprite();
			this.addChild( m_canva );
			m_canva.x = 10;
			m_canva.y = 10;
			
			//create the maze
			createMaze();
			createActor();
			createHumans();
			createMazeMask();
			createMoverMask();
			
			m_canva.addChild( m_mazeCanva );
			m_canva.addChild( m_mazeMask );
			m_canva.addChild( m_moverCanva );
			m_canva.addChild( m_moverMask );
			
			//set mask
			m_moverCanva.mask = m_moverMask;
			m_mazeCanva.mask = m_mazeMask;
			
			//start bgm
			PBE.soundManager.play( "../assets/bgm.mp3" );
		}
		
		//------------------------------ private function ----------------------------------
		
		//create the maze
		private function createMaze():void
		{
			m_maze = new SubMaze();
			m_maze.Create( GameDefine.MAZE_WIDTH, GameDefine.MAZE_HEIGHT, GameDefine.MAZE_GRID_SIZE, GameDefine.MAZE_GRID_SIZE );
			MazeGenerator.GenRandomMaze( m_maze );
			
			m_mazeCanva = MazeRender.DrawMaze( m_maze );
		}
		
		//create the actor
		private function createActor():void
		{
			m_actor = new Human( Resource.OBJ );
			m_actorHolder = new HeroHolder();
			
			m_actorHolder.AttachMover( m_actor );
			m_actorHolder.AttachSpace( m_maze );
			MoverHolderManager.Singleton.AddHolder( m_actorHolder );
			
			m_moverCanva.addChild( m_actor as Sprite );
		}
		
		//create all the human
		private function createHumans():void
		{
			m_humans = new Array();
			
			var human:Human = null;
			var humanControl:IMoverController = null;
			for ( var i:int = 0; i < GameDefine.HumanCount; i++ )
			{
				human = new Human( Resource.OBJ, new Point( int( GameDefine.MAZE_WIDTH * Math.random() ) * GameDefine.MAZE_GRID_SIZE + GameDefine.MAZE_GRID_SIZE * 0.5,
															int( GameDefine.MAZE_HEIGHT * Math.random() ) * GameDefine.MAZE_GRID_SIZE + GameDefine.MAZE_GRID_SIZE * 0.5 ) );
				
				humanControl = new HumanHolder();
				humanControl.AttachMover( human );
				humanControl.AttachSpace( m_maze );
				MoverHolderManager.Singleton.AddHolder( humanControl );
				
				m_moverCanva.addChild( human );
			}
		}
		
		//create a maze mask
		private function createMazeMask():void
		{
			m_mazeMask = new Sprite();
		}
		
		//create mover mask
		private function createMoverMask():void
		{
			m_moverMask = ( new Shape ) as Sprite;
			m_moverMask.width = 100;
			m_moverMask.height = 100;
		}
		
		//update mask area
		private function updateArea():void
		{
			m_mazeMask.graphics.beginFill( 0xffffff );
			m_mazeMask.graphics.drawCircle( m_actor.x, m_actor.y, 60 );
			m_mazeMask.graphics.endFill();
		}
		
		//------------------------------- event callback -----------------------------------
		
	}

}