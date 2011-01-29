package Manager 
{
	import flash.geom.Point;
	import Mover.IMaster;
	import Mover.IMover;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-30 1:09
	 */
	public class MasterManager 
	{
		//------------------------------ static member -------------------------------------
		
		static private var m_instance:MasterManager = null;
		static private var m_safeFlag:Boolean = false;
		
		//------------------------------ private member ------------------------------------
		
		private var m_masterList:Array = null;
		
		private var m_actor:IMaster = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function MasterManager() 
		{
			if ( m_safeFlag == false )
			{
				throw new Error( "[Error] this is a singleton, can not be new directly !" );
			}
			else
			{
				initial();
			}
		}
		
		/**
		 * @desc	return the singleton of this class
		 */
		public static function get Singleton():MasterManager
		{
			if ( m_instance == null )
			{
				m_safeFlag = true;
				m_instance = new MasterManager();
				m_safeFlag = false;
			}
		
			return m_instance;
		}
		
		/**
		 * @desc	add a master
		 * @param	master
		 */
		public function AddMaster( master:IMaster, actor:Boolean = false ):void
		{
			m_masterList.push( master );
			
			if ( actor == true )
			{
				m_actor = master;
			}
		}
		
		/**
		 * @desc	master hit test
		 * @param	mover
		 * @return
		 */
		public function HitMaster( mover:IMover ):IMaster
		{
			var len:int = m_masterList.length;
			
			var master:IMaster;
			var masterMover:IMover;
			var distance:Point;
			for ( var i:int = 0; i < len; i++ )
			{
				master = m_masterList[i] as IMaster;
				masterMover = master.GetIMover();
				
				distance = mover.GetPosition().subtract( masterMover.GetPosition() );
				
				if ( distance.length < masterMover.Redius() )
				{
					return master;
				}
			}
			
			return null;
		}
		
		/**
		 * @desc	judge if hit with actor of not
		 * @param	mover
		 * @return
		 */
		public function HitActor( mover:IMover ):Boolean
		{
			var act:IMover = m_actor.GetIMover();
			var distance:Point = mover.GetPosition().subtract( act.GetPosition() );
			
			if ( distance.length < ( mover.Redius() + act.Redius() ) )
			{
				return true;
			}
			
			return false;
		}
		
		//------------------------------ private function ----------------------------------
		
		//initial the singleton
		private function initial():void
		{
			m_masterList = new Array();
		}
		
		//------------------------------- event callback -----------------------------------	
	}

}