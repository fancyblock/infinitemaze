package
{
	import Maze.Cell;
	import Maze.MazeDef;
	import Maze.SubMaze;
	
	import data.Resource;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * @author	hejiabin
	 * @date	2010.11.06
	 */
	public class MazeRender
	{
		//-------------------------------------- static member ------------------------------------------------
		
		static private var CELL_SIZE:Number = 20;
		
		//-------------------------------------- static function ----------------------------------------------
		
		static public function DrawMaze( canva:DisplayObjectContainer, maze:SubMaze, offset:Point = null ):void
		{
			var i:int;
			var j:int;
					
			var wid:int = maze.WIDTH;
			var hei:int = maze.HEIGHT;
					
			var cel:Cell;
			for( i = 0; i < wid; i++ )
			{
				for( j = 0; j < hei; j++ )
				{
					cel = maze.GetCell( i, j );
					
					if ( offset == null )
					{
						drawCell( canva, cel, i * CELL_SIZE, j * CELL_SIZE );
					}
					else
					{
						drawCell( canva, cel, offset.x + i * CELL_SIZE, offset.y + j * CELL_SIZE );
					}
				}
			}
		}
		
		//-------------------------------------- private function ---------------------------------------------
		
		static private function drawCell( canva:DisplayObjectContainer, cel:Cell, offsetX:Number, offsetY:Number ):void
		{
			var wall:Sprite;
			
			if( cel.IsOpen( MazeDef.DIR_0 ) == false )
			{
				wall = new Resource.WALL_DIR0 as Sprite;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
				
			if( cel.IsOpen( MazeDef.DIR_3 ) == false )
			{
				wall = new Resource.WALL_DIR3 as Sprite;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
			
			if( cel.IsOpen( MazeDef.DIR_6 ) == false )
			{
				wall = new Resource.WALL_DIR6 as Sprite;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
				
			if( cel.IsOpen( MazeDef.DIR_9 ) == false )
			{
				wall = new Resource.WALL_DIR9 as Sprite;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
		}

	}
}