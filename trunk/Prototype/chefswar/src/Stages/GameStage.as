package Stages 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import Interface.IBeatGenerator;
	import Interface.ICenterControl;
	import Interface.ISpace;
	import LogicComponent.CenterControl;
	import LogicComponent.GameComponent.BeatGenerator;
	import LogicComponent.SpaceComponent;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GameStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
			
		//-------------------------------- private member -----------------------------------
		
		private var m_fightAni:MovieClip = null;
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
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void 
		{
			this.addChild( UI_ROOT );
			
			m_fightAni = UI_ROOT.getChildByName( "mcFightAni" ) as MovieClip;
		}
		
		//enter callback
		override protected function onEnter():void 
		{
			trace( "game start" );
			
			createLevel();
			gameStart();
			
			m_fightAni.play();
		}
		
		//frame callback
		override protected function onFrameTick( delta:Number ):void
		{
			m_centerControl.Update();
			
			//level over
			if ( m_centerControl.IsStopped() == true )
			{
				m_centerControl.ClearAllComponents();
				
				this.FadeOutToScreen( StageEnum.eGameOverStage );
			}
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
			
			//initial space
			var space:ISpace = new SpaceComponent();
			space.SetSize( GameSettings.SPACE_SIZE_WID, GameSettings.SPACE_SIZE_HEI, GameSettings.SPACE_SIZE_LEN );
			m_centerControl.AddComponent( space );
			
			//initial beat generator component
			var beatGen:IBeatGenerator = new BeatGenerator();
			beatGen.SetBeatsBase( GlobalWork.g_soundBeatsBase );
			beatGen.SetSpace( space );
			m_centerControl.AddComponent( beatGen );
			
			//[unfinished]
		}
		
		//start the game
		private function gameStart():void
		{
			m_centerControl.Start();
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}