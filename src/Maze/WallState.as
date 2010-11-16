package  
{
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2010.11.14
	 */
	public class WallState 
	{
		//-------------------------------------- private member ------------------------------------------
		
		private var m_stateInfo:Array = null;
		
		//-------------------------------------- public function -----------------------------------------
		
		/**
		 * @desc	return the wallState length
		 */
		public function get LENGTH():int
		{
			if ( m_stateInfo == null )
			{
				return 0;
			}
			
			return m_stateInfo.length;
		}
		
		/**
		 * @desc	return the wall state
		 * @param	index
		 * @return
		 */
		public function GetState( index:int ):Boolean
		{
			if ( m_stateInfo == null )
			{
				return false;
			}
			
			return m_stateInfo[index];
		}
		
		/**
		 * @desc	create a wallState randomly
		 * @param	len
		 * @param	randFactor
		 */
		public function RandCreate( len:int, randFactor:Number ):void
		{
			m_stateInfo = new Array();
			
			for ( var i:int = 0; i < len; i++ )
			{
				//[unfinished]
			}
		}
		
	}

}