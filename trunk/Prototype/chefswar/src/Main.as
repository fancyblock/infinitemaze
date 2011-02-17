package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.pblabs.engine.PBE;
	import Stages.GameStage;
	import Stages.SoundLoadStage;
	import Stages.StageEnum;
	import Stages.WelcomeStage;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	[SWF(width="405", height="802", backgroundColor="0x000000")]
	public class Main extends Sprite 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Main
		 */
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			PBE.startup( this );
			
			PBE.screenManager.registerScreen( StageEnum.eWelcomeStage, new WelcomeStage() );
			PBE.screenManager.registerScreen( StageEnum.eSoundLoadStage, new SoundLoadStage() );
			PBE.screenManager.registerScreen( StageEnum.eGameStage, new GameStage() );
			
			PBE.screenManager.push( StageEnum.eWelcomeStage );
			
		}
		
		//-------------------------------- callback function --------------------------------
		
	}
	
}
