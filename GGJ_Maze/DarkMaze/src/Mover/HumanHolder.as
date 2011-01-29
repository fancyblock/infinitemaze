package Mover 
{
	import Define.GameDefine;
	import Maze.ISpace;
	import Mover.IMover;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011/1/29 16:39
	 */
	public class HumanHolder implements IMoverController 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_mover:IMover = null;
		private var m_space:ISpace = null;
		
		private var m_state:String = null;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function HumanHolder() 
		{
			
		}
		
		/* INTERFACE Mover.IMoverController */
		
		public function AttachMover(mover:IMover):void 
		{
			m_mover = mover;
		}
		
		public function AttachSpace(space:ISpace):void 
		{
			m_space = space;
		}
		
		public function Move(dir:int, distance:Number):Boolean 
		{
			return true;
		}
		
		public function Update(timeLapse:Number):void 
		{
			switch( m_state )
			{
			case GameDefine.GameState_Peace:
				//[unfinished]
				break;
			case GameDefine.GameState_Fight:
				//[unfinished]
				break;
			default:
				break;
			}
		}
		
		public function SetState( state:String ):void
		{
			m_state = state;
		}
		
		//-------------------------------- private function --------------------------------
		
		//-------------------------------- callback function -------------------------------
		
	}

}