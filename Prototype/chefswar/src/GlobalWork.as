package  
{
	import dataStruct.GameSettings;
	import dataStruct.LevelInfo;
	import Interface.ISoundBeatsBase;
	import Interface.ISoundPlayer;
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GlobalWork 
	{
		//static data
		public static var g_gameSetting:GameSettings = null;
		
		//dynamic data
		public static var g_curSound:String = null;
		public static var g_soundPlayer:ISoundPlayer = null;
		public static var g_soundBeatsBase:ISoundBeatsBase = null;
		public static var g_levelInfo:LevelInfo = null;
	}

}
