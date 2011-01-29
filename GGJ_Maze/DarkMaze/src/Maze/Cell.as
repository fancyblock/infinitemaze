package Maze
{
	import flash.geom.Point;
	import Define.DirectionDef;
	
	/**
	 * @author	Hejiabin
	 * @date	2010.10.31
	 */
	public class Cell
	{
		//--------------------------------- private member -----------------------------------
		
		private var m_position:Point = new Point();
		private var m_wallExist:Array = new Array();
		private var m_additionalInfo:int = 0;		
		
		//--------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function Cell()
		{
			m_wallExist[DirectionDef.DIR_0] = true;
			m_wallExist[DirectionDef.DIR_3] = true;
			m_wallExist[DirectionDef.DIR_6] = true;
			m_wallExist[DirectionDef.DIR_9] = true;
		}
		
		/**
		 * @desc	reset the cell
		 * @para	open all the wall or close
		 */
		public function Reset( open:Boolean ):void
		{
			var wallState:Boolean;
			if( open == true )
			{
				wallState = false;
			}
			else
			{
				wallState = true;
			}
			
			m_wallExist[DirectionDef.DIR_0] = wallState;
			m_wallExist[DirectionDef.DIR_3] = wallState;
			m_wallExist[DirectionDef.DIR_6] = wallState;
			m_wallExist[DirectionDef.DIR_9] = wallState;
		}
		
		/**
		 * @desc	return if this directoin has a wall
		 * @para	direction of the cell
		 * @return	if wall exist, return false
		 */
		public function IsOpen( dir:int ):Boolean
		{
			return ! m_wallExist[dir];
		}
		
		/**
		 * @desc	set the wall of cell state
		 * @para	dir: wall direction of the cell
		 * @para	open: true for open the wall
		 */
		public function SetWallState( dir:int, open:Boolean ):void
		{
			m_wallExist[dir] = ! open;
		}
		
		/**
		 * @desc	set the cell position
		 * @para	x: X position of cell
		 * @para	y: Y position of cell
		 */
		public function SetPosition( x:int, y:int ):void
		{
			m_position.x = x;
			m_position.y = y;
		}
		
		/**
		 * @desc	return the position of the cell
		 */
		public function get POSITION():Point
		{
			return m_position;
		}
		
		/**
		 * @desc	write the additional info
		 * @para	info
		 */
		public function set ADD_INFO( info:int ):void
		{
			m_additionalInfo = info;
		}
		
		/**
		 * @desc	read the additional info
		 * @return	additional object
		 */
		public function get ADD_INFO():int
		{
			return m_additionalInfo;
		}

	}
}