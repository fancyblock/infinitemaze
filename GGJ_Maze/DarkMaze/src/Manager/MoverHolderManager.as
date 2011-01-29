package Manager 
{
	import Mover.IMoverController;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-29 1:34
	 */
	public class MoverHolderManager 
	{
		//------------------------------ static member -------------------------------------
		
		static private var m_instance:MoverHolderManager = null;
		static private var m_safeFlag:Boolean = false;
		
		//------------------------------ private member ------------------------------------
		
		private var m_moverHolders:Array = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function MoverHolderManager() 
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
		public static function get Singleton():MoverHolderManager
		{
			if ( m_instance == null )
			{
				m_safeFlag = true;
				m_instance = new MoverHolderManager();
				m_safeFlag = false;
			}
		
			return m_instance;
		}
		
		/**
		 * @desc	add a holder to the manager
		 * @param	hold
		 */
		public function AddHolder( hold:IMoverController ):void
		{
			m_moverHolders.push( hold );
		}
		
		/**
		 * @desc	update all the holder
		 */
		public function Update():void
		{
			var len:int = m_moverHolders.length;
			
			for ( var i:int = 0; i < len; i++ )
			{
				var hold:IMoverController = m_moverHolders[i] as IMoverController;
				hold.Update( 0 );
			}
		}
		
		//------------------------------ private function ----------------------------------
		
		//initial the singleton
		private function initial():void
		{
			m_moverHolders = new Array();
		}
		
		//------------------------------- event callback -----------------------------------	
	}

}