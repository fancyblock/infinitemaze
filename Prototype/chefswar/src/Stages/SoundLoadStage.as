package Stages 
{
	import Interface.ISoundLoader;
	import LogicComponent.BaseSoundBeatsBase;
	import LogicComponent.BaseSoundLoader;
	import LogicComponent.BaseSoundPlayer;
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class SoundLoadStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_soundLoader:ISoundLoader = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of SoundLoadStage
		 */
		public function SoundLoadStage() 
		{
			super();
			
			this.embedUI( new LoadStageUI );
		}
		
		/**
		 * @desc	frame func
		 * @param	delta
		 */
		override public function onFrame (delta:Number) : void
		{
			if ( m_soundLoader.IsLoadComplete() == true )
			{
				this.FadeOutToScreen( StageEnum.eGameStage );
			}
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void 
		{
			this.addChild( UI_ROOT );
		}
		
		//enter callback
		override protected function onEnter():void 
		{
			trace( "load sound..." );
			
			//initial some game logic components
			m_soundLoader = new BaseSoundLoader();
			GlobalWork.g_soundPlayer = new BaseSoundPlayer();
			GlobalWork.g_soundBeatsBase = new BaseSoundBeatsBase();
			
			//load the sound
			m_soundLoader.SetBeatsBase( GlobalWork.g_soundBeatsBase );
			m_soundLoader.SetSoundPlayer( GlobalWork.g_soundPlayer );
			m_soundLoader.LoadSound( GlobalWork.g_curSound );
			
		}
		
		//leave callback
		override protected function onLeave():void 
		{
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}