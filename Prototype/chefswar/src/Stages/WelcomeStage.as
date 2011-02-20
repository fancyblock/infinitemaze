package Stages 
{
	import dataStruct.ActionInfo;
	import dataStruct.GameSettings;
	import Enums.BeatFlag;
	import Enums.FlyingObj;
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
			GlobalWork.g_gameSetting.AllGestures.push( new ActionInfo( FlyingObj.FO_DISH, "222", FlyingObj.FO_DISH ) );
			GlobalWork.g_gameSetting.AllGestures.push( new ActionInfo( FlyingObj.FO_KNIFE, "111", FlyingObj.FO_KNIFE ) );
			GlobalWork.g_gameSetting.AllGestures.push( new ActionInfo( FlyingObj.FO_CUP, "000", FlyingObj.FO_CUP ) );
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