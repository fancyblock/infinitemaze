package LogicComponent.GameComponent 
{
	import com.pblabs.engine.components.TickedComponent;
	import Interface.ISoundPlayer;
	import Interface.IUpdateable;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class CenterControlComponent extends TickedComponent
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_soundPlayer:ISoundPlayer = null;
		private var m_curTime:Number = 0;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of CenterControlComponent
		 */
		public function CenterControlComponent() 
		{
		}
		
		/* INTERFACE Interface.ICenterControl */
		
		/**
		 * @desc	set sound player
		 * @param	player
		 */
		public function SetSoundPlayer(player:ISoundPlayer):void 
		{
			m_soundPlayer = player;
		}
		
		/**
		 * @desc	play the music
		 */
		public function Start():void 
		{
			m_curTime = 0;
			m_soundPlayer.Play();
		}
		
		/**
		 * @desc	tick function
		 * @param	deltaTime
		 */
		override public function onTick (deltaTime:Number) : void
		{
			m_curTime = m_soundPlayer.GetCurTime();
		}
		
		/**
		 * @desc	return the current time
		 * @return
		 */
		public function get CUR_TIME():Number
		{
			return m_curTime;
		}
		
		/**
		 * @desc	stop the music
		 */
		public function Stop():void 
		{
			m_soundPlayer.Stop();
		}
		
		/**
		 * @desc	judge whether the music is stop or not
		 * @return
		 */
		public function IsStopped():Boolean 
		{
			return m_soundPlayer.IsStopped();
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}