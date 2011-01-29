package Mover 
{
	import data.Resource;
	import Define.GameDefine;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-29 1:18
	 */
	public class Human extends Sprite implements IMover 
	{
		//-------------------------------- static member ------------------------------------
			
		//-------------------------------- private member -----------------------------------
		
		private var m_nextPos:Point = null;
		private var m_redius:Number = 0;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Human
		 */
		public function Human( profile:Class, pos:Point = null ) 
		{
			//create the hero
			var spr:Sprite = new profile() as Sprite;
			this.addChild( spr );
			spr.x = 0;
			spr.y = 0;
			
			m_redius = spr.width * 0.5 + GameDefine.MazeWallBold;
			
			if ( pos == null )
			{
				this.x = GameDefine.MAZE_WIDTH * GameDefine.MAZE_GRID_SIZE * 0.5 + GameDefine.MAZE_GRID_SIZE * 0.5;
				this.y = GameDefine.MAZE_HEIGHT * GameDefine.MAZE_GRID_SIZE * 0.5 + GameDefine.MAZE_GRID_SIZE * 0.5;
			}
			else
			{
				this.x = pos.x;
				this.y = pos.y;
			}
		}
		
		/* INTERFACE Mover.IMover */
		
		public function GetPosition():Point 
		{
			return new Point( this.x, this.y );
		}
		
		public function Redius():Number 
		{	
			return m_redius;
		}
		
		public function SetNextPosition( pos:Point ):void
		{
			m_nextPos = pos;
		}
		
		public function GetNextPosition():Point
		{
			return m_nextPos;
		}
		
		public function Update():void
		{
			this.x = m_nextPos.x;
			this.y = m_nextPos.y;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}