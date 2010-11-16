package Maze
{
	import flash.geom.Point;
	/**
	 * @author	Hejiabin
	 * @date	2010.10.31
	 */
	public class SubMaze
	{
		//---------------------------------- private member ---------------------------------------
		
		private var m_width:int = 0;
		private var m_height:int = 0;
		private var m_cells:Array = null;
		private var m_cellSize:Point = null;
		
		private var m_adjacentMaze:Array = null;
		
		//---------------------------------- public function --------------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function SubMaze()
		{
			m_adjacentMaze = new Array( 4 );
			m_adjacentMaze[MazeDef.DIR_0] = null;
			m_adjacentMaze[MazeDef.DIR_3] = null;
			m_adjacentMaze[MazeDef.DIR_6] = null;
			m_adjacentMaze[MazeDef.DIR_9] = null;
		}
		
		/**
		 * @desc	create the nest
		 * @para	wid: width
		 * @para	hei: height
		 */
		public function Create( wid:int, hei:int, cellWid:Number, cellHei:Number, offsetX:int = 0, offsetY:int = 0 ):void
		{
			m_width = wid;
			m_height = hei;
			
			var i:int;
			var j:int;
			m_cells = new Array();
			for( i = 0; i < wid; i++ )
			{
				m_cells[i] = new Array();
				for( j = 0; j < hei; j++ )
				{
					m_cells[i][j] = new Cell();
					m_cells[i][j].SetPosition( offsetX + i, offsetY + j );
				}
			}
			
			m_cellSize = new Point( cellWid, cellHei );
		}
		
		/**
		 * @desc	getter : get the width of maze
		 */
		public function get WIDTH():int { return m_width; }
		
		/**
		 * @desc	setter : set the height of maze
		 */
		public function get HEIGHT():int { return m_height; }
		
		/**
		 * @desc	return the specified cell
		 * @para	x: xpos
		 * @para	y: ypos
		 */
		public function GetCell( x:int, y:int ):Cell
		{
			if( x < 0 || y < 0 || x >= m_width || y >= m_height )
			{
				return null;
			}
			
			return m_cells[x][y];
		}
		
		/**
		 * @desc	set the adjacent maze of this
		 * @para	dir
		 * @para	maze
		 * @return	boolea : success of fail
		 */
		public function SetAdjacentMaze( dir:int, maze:SubMaze ):Boolean
		{
			//judge if the width is matched
			if( dir == MazeDef.DIR_0 || dir == MazeDef.DIR_6 )
			{
				if( maze.WIDTH != this.WIDTH )
				{
					return false;
				}
			}
			else
			//judge if the height is matched
			if( dir == MazeDef.DIR_3 || dir == MazeDef.DIR_9 )
			{
				if( maze.HEIGHT != this.HEIGHT )
				{
					return false;
				}
			}
			else
			{
				return false;
			}
			
			m_adjacentMaze[dir] = maze;
			
			return true;
		}
		
		/**
		 * @desc	judge if a line is through the maze wall
		 * @param	startPos
		 * @param	endPos
		 * @return
		 */
		public function HitTest( startPos:Point, endPos:Point ):Boolean
		{
			//[unfinished]
			
			return false;
		}
		
		//--------------------------------------- private function ------------------------------------------
		
		private function brakeWall( dir:int ):Boolean
		{
			if( m_adjacentMaze[dir] == null )
			{
				return false;
			}
			
			//[unfinished]
			
			return true;
		}
		
	}
}