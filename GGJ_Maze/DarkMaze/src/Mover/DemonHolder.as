package Mover 
{
	import Define.GameDefine;
	import Maze.ISpace;
	import Mover.IMover;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-30 2:52
	 */
	public class DemonHolder extends HeroHolder
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of DemonHolder
		 */
		public function DemonHolder() 
		{
		}
		
		/**
		 * @desc	update demon
		 * @param	timeLapse
		 */
		override public function Update( timeLapse:Number ):void
		{
			switch( m_state )
			{
			case GameDefine.GameState_Peace:
				break;
			case GameDefine.GameState_Fight:
				//[unfinished]
				break;
			default:
				break;
			}
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}