package Interface 
{
	import dataStruct.Beat;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISoundBeatsBase 
	{
		function AddBeat( beat:Beat ):void;
		
		function SoreBeats():void;
		
		function Clear():void;
		
		function GetBeatsBetween( timeSpot1:Number, timeSpot2:Number ):Array;
		
		function GetNewBeatsBefore( timeSpot:Number ):Array;
	}
	
}