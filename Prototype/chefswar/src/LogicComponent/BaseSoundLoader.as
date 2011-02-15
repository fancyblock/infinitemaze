package LogicComponent 
{
	import Interface.ISoundBeatsBase;
	import Interface.ISoundLoader;
	import Interface.ISoundPlayer;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseSoundLoader implements ISoundLoader 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseSoundLoader
		 */
		public function BaseSoundLoader() 
		{
			
		}
		
		/* INTERFACE Interface.ISoundLoader */
		
		public function SetSoundPlayer(player:ISoundPlayer):void 
		{
			//[unfinished]
		}
		
		public function SetBeatsBase(beatsBase:ISoundBeatsBase):void 
		{
			//[unfinished]
		}
		
		public function LoadSound(soundInfoPath:String):Boolean 
		{
			//[unfinished]
			
			return true;
		}
		
		public function IsLoadComplete():Boolean 
		{
			//[unfinished]
			
			return false;
		}
		
		public function GetLoadProgress():Number 
		{
			//[unfinished]
			
			return 1;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}