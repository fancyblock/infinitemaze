package LogicComponent 
{
	import Interface.ICenterControl;
	import Interface.ISoundPlayer;
	import Interface.IUpdateable;
	
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
		
		public function AddComponent(comp:IUpdateable):void 
		{
			//[unfinished]
		}
		
		public function ClearAllComponents():void
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