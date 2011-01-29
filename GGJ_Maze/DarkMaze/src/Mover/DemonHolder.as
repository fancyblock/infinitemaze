package Mover 
{
	import Define.GameDefine;
	import Manager.MasterManager;
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
				m_mover.SetActive( false );
				break;
			case GameDefine.GameState_Fight:
				m_mover.SetActive( true );
				if ( MasterManager.Singleton.HitActor( m_mover ) == true )
				{
					//[unfinished]
				}
				break;
			default:
				break;
			}
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}