package 
{
	import com.pblabs.engine.PBE;
	import com.pblabs.rendering2D.ui.SceneView;
	import flash.display.Sprite;
	import flash.events.Event;
	import Stages.GameOverStage;
	import Stages.GameStage;
	import Stages.SoundLoadStage;
	import Stages.StageEnum;
	import Stages.WelcomeStage;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	[SWF(width="480", height="320", backgroundColor="0x555555")]
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
			
			//initial the sceneView
			var sceneView:SceneView = new SceneView();
			sceneView.width = SystemParameter.SCREEN_WIDTH;
			sceneView.height = SystemParameter.SCREEN_HEIGHT;
			PBE.initializeScene( sceneView );
			
			//initial all the screen
			PBE.screenManager.registerScreen( StageEnum.eWelcomeStage, new WelcomeStage() );
			PBE.screenManager.registerScreen( StageEnum.eSoundLoadStage, new SoundLoadStage() );
			PBE.screenManager.registerScreen( StageEnum.eGameStage, new GameStage() );
			PBE.screenManager.registerScreen( StageEnum.eGameOverStage, new GameOverStage() );
			
			PBE.screenManager.push( StageEnum.eWelcomeStage );
			
		}
		
		//-------------------------------- callback function --------------------------------
		
	}
	
}
