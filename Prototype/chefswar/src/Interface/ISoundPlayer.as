package Interface 
{
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISoundPlayer 
	{
		function SetSound( song:Sound ):void;
		
		function Play():void;
		
		function GetCurTime():Number;	//millisecond
		
		function Stop():void;
		
		function IsStopped():Boolean;
	}
	
}