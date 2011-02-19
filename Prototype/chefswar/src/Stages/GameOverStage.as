package Stages 
{
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GameOverStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of GameOverStage
		 */
		public function GameOverStage() 
		{
			super();
			
			this.embedUI( new GameOverUI );
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void 
		{
			this.addChild( UI_ROOT );
		}
		
		//-------------------------------- callback function --------------------------------
		
		
	}

}