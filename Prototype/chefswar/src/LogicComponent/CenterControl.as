package LogicComponent 
{
	import Interface.ICenterControl;
	import Interface.IFuncComponent;
	import Interface.ISoundPlayer;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class CenterControl implements ICenterControl 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of CenterControl
		 */
		public function CenterControl() 
		{
			
		}
		
		/* INTERFACE Interface.ICenterControl */
		
		public function SetSoundPlayer(player:ISoundPlayer):void 
		{
			//[unfinished]
		}
		
		public function AddComponent(comp:IFuncComponent):void 
		{
			//[unfinished]
		}
		
		public function Start():void 
		{
			//[unfinished]
		}
		
		public function Update():void 
		{
			//[unfinished]
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