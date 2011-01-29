package Mover 
{
	import Define.GameDefine;
	import Manager.MasterManager;
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
		
		private var m_mover:Human = null;
		private var m_space:ISpace = null;
		
		private var m_state:String = null;
		
		private var m_master:IMaster = null;
		
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
			m_mover = mover as Human;
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
			var master:IMaster = MasterManager.Singleton.HitMaster( m_mover );
			
			// follow the new master
			if ( master != null )
			{
				if ( m_master != null )
				{
					unfollow( m_master );
				}
				
				m_master = master;
				follow( master );
			}
		}
		
		public function SetState( state:String ):void
		{
			m_state = state;
		}
		
		//-------------------------------- private function --------------------------------
		
		// follow master
		private function follow( master:IMaster ):void
		{
			master.AddSlave( m_mover );
			m_mover.filters = master.MasterFlag();
		}
		
		// unfollow master
		private function unfollow( master:IMaster ):void
		{
			master.RemoveSlave( m_mover );
			m_mover.filters = null;
		}
		
		//-------------------------------- callback function -------------------------------
		
	}

}