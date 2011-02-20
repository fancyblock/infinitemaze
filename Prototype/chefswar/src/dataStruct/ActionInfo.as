package dataStruct 
{
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class ActionInfo 
	{
		public var _name:String = null;
		public var _gestureCode:String = null;
		public var _hitType:String = null;
		public var _time:Number = 0;
		
		
		/**
		 * @desc	constructor of ActionInfo
		 */
		function ActionInfo( name:String, code:String, type:String )
		{
			_name = name;
			_gestureCode = code;
			_hitType = type;
		}
	}

}