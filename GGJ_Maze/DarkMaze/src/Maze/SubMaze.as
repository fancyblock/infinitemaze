package Maze
{
	import Define.DirectionDef;
	import Define.GameDefine;
	import flash.geom.Point;
	import Mover.IMover;
	
	/**
	 * @author	Hejiabin
	 * @date	2010.10.31
	 */
	public class SubMaze implements IMaze, ISpace
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
			m_adjacentMaze[DirectionDef.DIR_0] = null;
			m_adjacentMaze[DirectionDef.DIR_3] = null;
			m_adjacentMaze[DirectionDef.DIR_6] = null;
			m_adjacentMaze[DirectionDef.DIR_9] = null;
		}
		
		/**
		 * @desc	create the nest
		 * @para	wid: width
		 * @para	hei: height
		 */
		public function Create( wid:int, hei:int, cellWid:Number, cellHei:Number ):void
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
					m_cells[i][j].SetPosition( i, j );
				}
			}
			
			m_cellSize = new Point( cellWid, cellHei );
		}
		
		/**
		 * @desc	judge if this two point is...
		 * @param	src
		 * @param	dest
		 * @return
		 */
		public function IsConnected( src:Point, dest:Point ):Boolean
		{
			//[unfinished]
			
			return false;
		}
		
		/**
		 * @desc	judge if this object is hit with wall
		 * @param	pos
		 * @return
		 */
		public function IsHitWall( mover:IMover ):Boolean
		{
			var moverPos:Point = mover.GetNextPosition();
			
			var grid:Cell = GetCell( moverPos.x / GameDefine.MAZE_GRID_SIZE, 
										moverPos.y / GameDefine.MAZE_GRID_SIZE );
										
			var radius:Number = mover.Redius();
			var pos:Point = new Point( moverPos.x - grid.POSITION.x * GameDefine.MAZE_GRID_SIZE,
										moverPos.y - grid.POSITION.y * GameDefine.MAZE_GRID_SIZE );

			if ( grid.IsOpen( DirectionDef.DIR_0 ) == false && ( pos.y - radius ) < 0 )
			{
				return true;
			}
			if ( grid.IsOpen( DirectionDef.DIR_3 ) == false && ( pos.x + radius ) > GameDefine.MAZE_GRID_SIZE )
			{
				return true;
			}
			if ( grid.IsOpen( DirectionDef.DIR_6 ) == false && ( pos.y + radius ) > GameDefine.MAZE_GRID_SIZE )
			{
				return true;
			}
			if ( grid.IsOpen( DirectionDef.DIR_9 ) == false && ( pos.x - radius ) < 0 )
			{
				return true;
			}
			
			return false;
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
		
		//--------------------------------------- private function ------------------------------------------
				
	}
}