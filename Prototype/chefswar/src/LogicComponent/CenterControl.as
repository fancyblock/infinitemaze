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
		
		private var m_soundPlayer:ISoundPlayer = null;
		private var m_components:Array = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of CenterControl
		 */
		public function CenterControl() 
		{
			m_components = new Array();
		}
		
		/* INTERFACE Interface.ICenterControl */
		
		public function SetSoundPlayer(player:ISoundPlayer):void 
		{
			m_soundPlayer = player;
		}
		
		public function AddComponent(comp:IUpdateable):void 
		{
			m_components.push( comp );
		}
		
		public function ClearAllComponents():void
		{
			m_components = new Array();
		}
		
		public function Start():void 
		{
			m_soundPlayer.Play();
		}
		
		public function Update():void 
		{
			//get current music progress
			var curTime:Number = m_soundPlayer.GetCurTime();
			
			//update all the updateable components
			var len:int = m_components.length;
			var com:IUpdateable;
			
			for ( var i:int = 0; i < len; i++ )
			{
				com = m_components[i] as IUpdateable;
				com.Update( curTime );
			}
		}
		
		public function Stop():void 
		{
			m_soundPlayer.Stop();
		}
		
		public function IsStopped():Boolean 
		{
			return m_soundPlayer.IsStopped();
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}