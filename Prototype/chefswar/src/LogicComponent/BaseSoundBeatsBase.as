package LogicComponent 
{
	import dataStruct.Beat;
	import Interface.ISoundBeatsBase;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseSoundBeatsBase implements ISoundBeatsBase 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseSoundBeatsBase
		 */
		public function BaseSoundBeatsBase() 
		{
			//[unfinished]
		}
		
		/* INTERFACE Interface.ISoundBeatsBase */
		
		public function AddBeat(beat:Beat):void 
		{
			//[unfinished]
		}
		
		public function SoreBeats():void 
		{
			//[unfinished]
		}
		
		public function Clear():void 
		{
			//[unfinished]
		}
		
		public function GetBeatsBetween(timeSpot1:Number, timeSpot2:Number):Array 
		{
			var beatList:Array = new Array();
			
			//[unfinished]
			
			return beatList;
		}
		
		public function GetNewBeatsBefore(timeSpot:Number):Array 
		{
			var beatList:Array = new Array();
			
			//[unfinished]
			
			return beatList;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}