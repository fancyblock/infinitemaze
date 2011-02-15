package Interface 
{
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISoundLoader 
	{
		function SetSoundPlayer( player:ISoundPlayer ):void;
		
		function SetBeatsBase( beatsBase:ISoundBeatsBase ):void;
		
		function LoadSound( soundInfoPath:String ):Boolean;
		
		function IsLoadComplete():Boolean;
		
		function GetLoadProgress():Number;
	}
	
}