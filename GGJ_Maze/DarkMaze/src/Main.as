package 
{
	import com.pblabs.engine.PBE;
	import flash.display.Sprite;
	import flash.events.Event;
	import Stage.EndStage;
	import Stage.GameStage;
	import Stage.WelcomeStage;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011/1/28 20:22
	 */
	[SWF(width = "800", height = "600", backgroundColor = "0x000000")]
	public class Main extends Sprite 
	{
		//------------------------------ static member -------------------------------------
		
		//------------------------------ private member ------------------------------------
		
		//------------------------------ public function -----------------------------------
		
		/**
		 * @desc	constructor of Main
		 */
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//------------------------------ private function ----------------------------------
		
		//initial
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//[for test]
			this.stage.addChild( new GameMonitor() );
			
			PBE.startup( this );
			
			//regisit screen
			PBE.screenManager.registerScreen( WindowEnum.WelcomeScreen, new WelcomeStage() );
			PBE.screenManager.registerScreen( WindowEnum.GameScreen, new GameStage() );
			PBE.screenManager.registerScreen( WindowEnum.EndScreen, new EndStage() );
			
			//entry point
			PBE.screenManager.push( WindowEnum.WelcomeScreen );
			
		}
		
		//------------------------------- event callback -----------------------------------
		
	}
	
}