package LogicComponent 
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import Interface.ISoundPlayer;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseSoundPlayer implements ISoundPlayer 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_sound:Sound = null;
		private var m_soundChannel:SoundChannel = null;
		private var m_isSndPlaying:Boolean = false;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseSoundPlayer
		 */
		public function BaseSoundPlayer() 
		{
			m_isSndPlaying = false;
		}
		
		/* INTERFACE Interface.ISoundPlayer */
		
		public function SetSound(song:Sound):void 
		{
			m_sound = song;
		}
		
		public function Play():void 
		{
			m_isSndPlaying = true;
			m_soundChannel = m_sound.play();
			m_soundChannel.addEventListener( Event.SOUND_COMPLETE, _onSoundComplete );
		}
		
		public function GetCurTime():Number 
		{
			return ( m_soundChannel.position / 1000.0 );
		}
		
		public function Stop():void 
		{
			m_soundChannel.stop();
		}
		
		public function IsStopped():Boolean 
		{
			return ( !m_isSndPlaying );
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
		private function _onSoundComplete( evt:Event ):void
		{
			m_soundChannel.removeEventListener( Event.SOUND_COMPLETE, _onSoundComplete );
			
			m_isSndPlaying = false;
		}
		
	}

}