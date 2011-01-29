package Maze
{
	import Define.DirectionDef;
	import flash.geom.Point;
	
	/**
	 * @author	Hejiabin
	 * @date	2010.10.31
	 */
	public class MazeGenerator
	{
		//------------------------------------- static function ---------------------------------------
		
		/**
		 * @desc	generate a random maze
		 */
		static public function GenRandomMaze( maze:IMaze ):void
		{
			var gridCnt:int = maze.WIDTH * maze.HEIGHT;
			
			var pathArray:Array = new Array();
			
			var unVisitDirList:Array;
			var curPos:Point = new Point( Math.random() * maze.WIDTH, Math.random() * maze.HEIGHT );
			var curCell:Cell = null;
			pathArray.push( curPos );
			while( gridCnt > 0 )
			{
				curCell = maze.GetCell( curPos.x, curPos.y );
				
				//visit this cell
				if( curCell.ADD_INFO == 0 )
				{
					curCell.ADD_INFO = 1;
					gridCnt--;
				}
				
				unVisitDirList = getUnvisitedDir( maze, curPos );
				
				//this cell no neighbor be unvisited
				if( unVisitDirList.length == 0 )
				{
					if( gridCnt > 0 )
					{
						if( pathArray.length == 0 )
						{
							throw new Error( "[Error]: visitDirList null" );
						}
						else
						{
							curPos = pathArray.pop();
							continue;
						}
					}
				}
				else
				{
					var nextDir:int = unVisitDirList[int( Math.random() * ( unVisitDirList.length ) )];
					
					curPos = gotoCell( maze, curPos, nextDir );
					pathArray.push( curPos );
				}
			}
		}
		
		//------------------------------------- private function ---------------------------------------
		
		//aux function of function GenRandomMaze
		static private function gotoCell( maze:IMaze, curPos:Point, nextDir:int ):Point
		{
			var nextPos:Point = new Point( curPos.x, curPos.y );
			
			var aginstDir:int;
			switch( nextDir )
			{
			case DirectionDef.DIR_0:
				aginstDir = DirectionDef.DIR_6;
				nextPos.y --;
				break;
			case DirectionDef.DIR_3:
				aginstDir = DirectionDef.DIR_9;
				nextPos.x ++;
				break;
			case DirectionDef.DIR_6:
				aginstDir = DirectionDef.DIR_0;
				nextPos.y ++;
				break;
			case DirectionDef.DIR_9:
				aginstDir = DirectionDef.DIR_3;
				nextPos.x --;
				break;
			default:
				throw new Error( "[Error]: Next direction error" );
			}
			
			var changeCell:Cell;
			
			changeCell = maze.GetCell( curPos.x, curPos.y );
			changeCell.SetWallState( nextDir, true );
			
			changeCell = maze.GetCell( nextPos.x, nextPos.y );
			changeCell.SetWallState( aginstDir, true );
			
			return nextPos;
		}
		
		//aux function of function GenRandomMaze
		static private function getUnvisitedDir( maze:IMaze, pos:Point ):Array
		{
			var unVisitedList:Array = new Array();
			
			var neighbor:Cell;
			
			neighbor = maze.GetCell( pos.x - 1, pos.y );
			if( neighbor != null && neighbor.ADD_INFO == 0 )
			{
				unVisitedList.push( DirectionDef.DIR_9 );
			}
			
			neighbor = maze.GetCell( pos.x + 1, pos.y );
			if( neighbor != null && neighbor.ADD_INFO == 0 )
			{
				unVisitedList.push( DirectionDef.DIR_3 );
			}
			
			neighbor = maze.GetCell( pos.x , pos.y - 1 );
			if( neighbor != null && neighbor.ADD_INFO == 0 )
			{
				unVisitedList.push( DirectionDef.DIR_0 );
			}
			
			neighbor = maze.GetCell( pos.x, pos.y + 1 );
			if( neighbor != null && neighbor.ADD_INFO == 0 )
			{
				unVisitedList.push( DirectionDef.DIR_6 );
			}
			
			return unVisitedList;
		}

	}
}