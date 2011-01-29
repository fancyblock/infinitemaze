package Stage 
{
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011/1/28 21:14
	 */
	public class WelcomeStage extends BaseUIScreen 
	{
		//------------------------------ static member -------------------------------------
		
		//------------------------------ private member ------------------------------------
		
		private var m_btnStart:SimpleButton = null;
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of WelcomeScreen
		 */
		public function WelcomeStage() 
		{
			super( "../assets/WelcomeBG.png" );
			
			//set the ui bgm
			this.UI_BGM = "../assets/Sound/BGM/InitialBGM.mp3";
			
			//load the ui
			this.embedUI( new WelcomeUI() );
		}
		
		//------------------------------ private function ----------------------------------
		
		//initial the ui
		override protected function initialUI():void
		{
			addChild( UI_ROOT );
			
			m_btnStart = UI_ROOT.getChildByName( "btnStart" ) as SimpleButton;
			
			//add event listener
			m_btnStart.addEventListener( MouseEvent.CLICK, _onStart );
			
			//set the button se
			this.SetMouseOverSnd( m_btnStart );
		}
		
		//------------------------------- event callback -----------------------------------
		
		//click start game
		private function _onStart( evt:MouseEvent ):void
		{
			FadeOutToScreen( WindowEnum.GameScreen );
		}
		
	}

}