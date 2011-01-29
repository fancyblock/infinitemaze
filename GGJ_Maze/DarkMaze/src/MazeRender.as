package
{
	import Define.GameDefine;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import Maze.Cell;
	import Define.DirectionDef;
	import Maze.SubMaze;
	
	
	/**
	 * @author	hejiabin
	 * @date	2010.11.06
	 */
	public class MazeRender
	{
		//-------------------------------------- static member ------------------------------------------------
		
		//-------------------------------------- static function ----------------------------------------------
		
		static public function DrawMaze( maze:SubMaze ):Bitmap
		{
			var i:int;
			var j:int;
					
			var wid:int = maze.WIDTH;
			var hei:int = maze.HEIGHT;
			
			var cel:Cell;
			var canva:Sprite = new Sprite();
			for( i = 0; i < wid; i++ )
			{
				for( j = 0; j < hei; j++ )
				{
					cel = maze.GetCell( i, j );
					
					drawCell( canva, cel, i * GameDefine.MAZE_GRID_SIZE, j * GameDefine.MAZE_GRID_SIZE );

				}
			}
			
			var bitmapdata:BitmapData = new BitmapData( canva.width, canva.height, true, 0x00000000 );
			bitmapdata.draw( canva );
			
			return new Bitmap( bitmapdata );
		}
		
		//-------------------------------------- private function ---------------------------------------------
		
		static private function drawCell( canva:DisplayObjectContainer, cel:Cell, offsetX:Number, offsetY:Number ):void
		{
			var wall:Sprite;
			
			if( cel.IsOpen( DirectionDef.DIR_0 ) == false )
			{
				wall = new wall_dir0;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
				
			if( cel.IsOpen( DirectionDef.DIR_3 ) == false )
			{
				wall = new wall_dir3;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
			
			if( cel.IsOpen( DirectionDef.DIR_6 ) == false )
			{
				wall = new wall_dir6;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
				
			if( cel.IsOpen( DirectionDef.DIR_9 ) == false )
			{
				wall = new wall_dir9;
				canva.addChild( wall );
				wall.x = offsetX;
				wall.y = offsetY;
			}
		}

	}
}