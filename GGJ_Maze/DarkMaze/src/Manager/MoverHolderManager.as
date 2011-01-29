package Manager 
{
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
		
		//------------------------------ private function ----------------------------------
		
		//initial the singleton
		private function initial():void
		{
			//[unfinished]
		}
		
		//------------------------------- event callback -----------------------------------	
	}

}