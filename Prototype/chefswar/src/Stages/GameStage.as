package Stages 
{
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import com.pblabs.engine.PBE;
	import LogicComponent.GameComponent.BeatGeneratorComponent;
	import LogicComponent.GameComponent.CenterControlComponent;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GameStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
			
		//-------------------------------- private member -----------------------------------
		
		private var m_fightAni:MovieClip = null;
		private var m_coreLogic:IEntity = null;
		
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
			//level over
			if ( ( m_coreLogic.lookupComponentByName( "CenterControl" ) as CenterControlComponent ).IsStopped() == true )
			{
				m_coreLogic.destroy();
				
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
			//allocate an entity
			m_coreLogic = PBE.allocateEntity();
			
			//add CenterControlComponent
			var centerControl:CenterControlComponent = new CenterControlComponent();
			centerControl.SetSoundPlayer( GlobalWork.g_soundPlayer );
			m_coreLogic.addComponent( centerControl, "CenterControl" );
			
			//initial beat generator component
			var beatGen:BeatGeneratorComponent = new BeatGeneratorComponent();
			beatGen.SetBeatsBase( GlobalWork.g_soundBeatsBase );
			beatGen.CUR_TIME = new PropertyReference( "@CenterControl.CUR_TIME" );
			m_coreLogic.addComponent( beatGen, "BeatGenerator" );
			
			//[unfinished]
			
			m_coreLogic.initialize( "GameLogic" );
		}
		
		//start the game
		private function gameStart():void
		{
			( m_coreLogic.lookupComponentByName( "CenterControl" ) as CenterControlComponent ).Start();
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}