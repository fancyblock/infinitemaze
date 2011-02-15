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
		}
		
		//enter callback
		override protected function onEnter():void 
		{
			gameInitial();
			
			this.addEventListener( MouseEvent.CLICK, _onClk );
		}
		
		//leave callback
		override protected function onLeave():void 
		{
		}
		
		//initial the game
		private function gameInitial():void
		{
			//[unfinished]
		}
		
		//-------------------------------- callback function --------------------------------
		
		private function _onClk( evt:MouseEvent ):void
		{
			GlobalWork.g_curSound = "LevelSample.xml";		//[temp]
			
			PBE.screenManager.push( StageEnum.eSoundLoadStage );
		}
		
	}

}