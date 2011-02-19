package Stages 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.pblabs.engine.PBE;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class WelcomeStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of WelcomeStage
		 */
		public function WelcomeStage() 
		{
			super();
			
			this.embedUI( new WelcomeStageUI );
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void 
		{
			this.addChild( UI_ROOT );
			
			this.addEventListener( MouseEvent.CLICK, _onClk );
		}
		
		//-------------------------------- callback function --------------------------------
		
		private function _onClk( evt:MouseEvent ):void
		{
			this.removeEventListener( MouseEvent.CLICK, _onClk );
			
			GlobalWork.g_curSound = "LevelSample.xml";		//[temp]
			
			this.FadeOutToScreen( StageEnum.eSoundLoadStage );
		}
		
	}

}