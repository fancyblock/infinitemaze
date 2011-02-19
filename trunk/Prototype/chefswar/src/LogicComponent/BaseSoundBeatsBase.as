package LogicComponent 
{
	import dataStruct.Beat;
	import Enums.BeatFlag;
	import Interface.ISoundBeatsBase;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseSoundBeatsBase implements ISoundBeatsBase 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_beats:Array = null;
		private var m_curVirginIndex:int = 0;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseSoundBeatsBase
		 */
		public function BaseSoundBeatsBase() 
		{
			m_beats = new Array();
		}
		
		/* INTERFACE Interface.ISoundBeatsBase */
		
		public function AddBeat(beat:Beat):void 
		{
			m_beats.push( beat );
		}
		
		public function SoreBeats():void 
		{
			//[unfinished]
		}
		
		public function Reset():void 
		{
			//flag the all the beats
			var len:int = m_beats.length;
			
			for ( var i:int = 0; i < len; i++ )
			{
				m_beats[i]._flag = BeatFlag.eVirginBeat;
			}
			
			//reset the local class flag
			m_curVirginIndex = 0;
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
			
			var beat:Beat;
			var len:int = m_beats.length;
			for ( var i:int = m_curVirginIndex; i < len; i++ )
			{
				beat = m_beats[i] as Beat;
				
				if ( beat._startTime <= timeSpot )
				{
					if ( beat._flag == BeatFlag.eVirginBeat )
					{
						beat._flag = BeatFlag.eFlyingBeat;
						beatList.push( beat );
						m_curVirginIndex++;
					}
				}
				else
				{
					break;
				}
			}
			
			return beatList;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}