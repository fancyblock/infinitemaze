package LogicComponent.GameComponent 
{
	import flash.display.Sprite;
	import Interface.IBeatGenerator;
	import Interface.ISoundBeatsBase;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BeatGenerator implements IBeatGenerator 
	{
	
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_beatsBase:ISoundBeatsBase = null;
		private var m_canva:Sprite = null;
		
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
		
		public function SetCanva(canva:Sprite):void 
		{
			m_canva = canva;
		}
		
		public function Update(time:Number):void 
		{
			//[unfinished]
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}