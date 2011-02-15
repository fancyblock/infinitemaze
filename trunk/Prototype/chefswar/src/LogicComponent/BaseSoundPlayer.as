package LogicComponent 
{
	import Interface.ISoundPlayer;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseSoundPlayer implements ISoundPlayer 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseSoundPlayer
		 */
		public function BaseSoundPlayer() 
		{
			
		}
		
		/* INTERFACE Interface.ISoundPlayer */
		
		public function SetSound(song:String):void 
		{
			//[unfinished]
		}
		
		public function Play():void 
		{
			//[unfinished]
		}
		
		public function GetCurTime():Number 
		{
			//[unfinished]
			
			return 0;
		}
		
		public function Stop():void 
		{
			//[unfinished]
		}
		
		public function IsStopped():Boolean 
		{
			//[unfinished]
			
			return false;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}