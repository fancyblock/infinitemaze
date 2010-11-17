package {
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import Maze.MazeGenerator;
	import Maze.SubMaze;
	import data.Resource;
	import Mover.Step;
	import Mover.Walker;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;

	/**
	 * @author	Hejiabin
	 * @date	2010.10.31
	 */
	public class InfiniteMaze extends Sprite
	{	
		//---------------------------------- private member ------------------------------------
		
		private var m_maze:SubMaze = null;
		private var m_walker:Walker = null;
		
		//---------------------------------- public function ----------------------------------- 
		
		public function InfiniteMaze()
		{
			//create the initial maze
			m_maze = new SubMaze();
			m_maze.Create( 20, 20, 20, 20 );
			MazeGenerator.GenRandomMaze( m_maze );
			
			//create the walker
			m_walker = new Walker();
			var spWalker:Sprite = new Resource.OBJ;
			this.stage.addChild( spWalker );
			
			//game control
			this.addEventListener( Event.ENTER_FRAME, _onFrame );
			this.stage.addEventListener( KeyboardEvent.KEY_DOWN, _onKeyDown );
		}
		
		//---------------------------------- private function ----------------------------------
		
		private function tick():void
		{
			cleanCanva( this );
			MazeRender.DrawMaze( this, m_maze );
		}
		
		//remove all child of canva
		private function cleanCanva( canva:DisplayObjectContainer ):void
		{
			while( canva.numChildren > 0 )
			{
				canva.removeChildAt( 0 );
			}
		}
		
		//---------------------------------- event callback ------------------------------------
		
		private function _onKeyDown( evt:KeyboardEvent ):void
		{
			switch( evt.keyCode )
			{
			case 119:	//[UP]
				//
				break;
			case 115:	//[DOWN]
				//
				break;
			case 97:	//[LEFT]
				//
				break;
			case 100:	//[RIGHT]
				//
				break;
			default:
				break;
			}
		}
		
		private function _onFrame( evt:Event ):void
		{
			tick();
		}
	}
}
