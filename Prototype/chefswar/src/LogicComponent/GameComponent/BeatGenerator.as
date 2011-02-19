package LogicComponent.GameComponent 
{
	import Interface.IBeatGenerator;
	import Interface.ISoundBeatsBase;
	import Interface.ISpace;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BeatGenerator implements IBeatGenerator 
	{
	
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_beatsBase:ISoundBeatsBase = null;
		private var m_space:ISpace = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BeatGenerator
		 */
		public function BeatGenerator() 
		{
			
		}
		
		/* INTERFACE Interface.IBeatGenerator */
		
		public function SetBeatsBase(beatsBase:ISoundBeatsBase):void 
		{
			m_beatsBase = beatsBase;
		}
		
		public function SetSpace( space:ISpace ):void
		{
			m_space = space;
		}
		
		public function Update(time:Number):void 
		{
			var curBeats:Array  = m_beatsBase.GetNewBeatsBefore( time );
			
			var len:int = curBeats.length;
			
			if ( len > 0 )
			{
				trace( curBeats[0]._type );
			}
			
			//[unfinished]
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}