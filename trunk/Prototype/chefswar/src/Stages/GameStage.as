package Stages 
{
	import flash.display.Sprite;
	import Interface.IBeatGenerator;
	import Interface.ICenterControl;
	import LogicComponent.CenterControl;
	import LogicComponent.GameComponent.BeatGenerator;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GameStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_canva:Sprite = null;
		private var m_centerControl:ICenterControl = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of GameStage
		 */
		public function GameStage() 
		{
			super();
			
			this.embedUI( new GameStageUI );
		}
		
		/**
		 * @desc	frame func
		 * @param	delta
		 */
		override public function onFrame (delta:Number) : void
		{
			m_centerControl.Update();
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void 
		{
			this.addChild( UI_ROOT );
			
			m_canva = UI_ROOT.getChildByName( "mcCanva" ) as Sprite;
		}
		
		//enter callback
		override protected function onEnter():void 
		{
			trace( "game start" );
			
			createLevel();
			gameStart();
		}
		
		//leave callback
		override protected function onLeave():void 
		{
		}
		
		//create the level
		private function createLevel():void
		{
			m_centerControl = new CenterControl();
			
			m_centerControl.SetSoundPlayer( GlobalWork.g_soundPlayer );
			
			//initial beat generator component
			var beatGen:IBeatGenerator = new BeatGenerator();
			beatGen.SetBeatsBase( GlobalWork.g_soundBeatsBase );
			beatGen.SetCanva( m_canva );
			
			m_centerControl.AddComponent( beatGen );
			
			//initial the space
		}
		
		//start the game
		private function gameStart():void
		{
			m_centerControl.Start();
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}