package Stages 
{
	import dataStruct.ActionInfo;
	import dataStruct.GameSettings;
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
		
		//enter callback
		override protected function onEnter():void 
		{
			//game initial
			
			GlobalWork.g_gameSetting = new GameSettings();
			GlobalWork.g_gameSetting.HitRange = 100;
			GlobalWork.g_gameSetting.AllGestures = new Array();
			GlobalWork.g_gameSetting.AllGestures.push( new ActionInfo( "dish", "222", "dish" ) );
			GlobalWork.g_gameSetting.AllGestures.push( new ActionInfo( "knife", "111", "knife" ) );
			GlobalWork.g_gameSetting.AllGestures.push( new ActionInfo( "cup", "000", "cup" ) );
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