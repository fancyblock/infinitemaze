package Interface 
{
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISoundPlayer 
	{
		function SetSound( song:String ):void;
		
		function Play():void;
		
		function GetCurTime():Number;	//millisecond
		
		function Stop():void;
		
		function IsStopped():Boolean;
	}
	
}