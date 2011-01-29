package Mover 
{
	import com.pblabs.engine.PBE;
	import Define.AnimationDef;
	import Define.GameDefine;
	import Manager.MasterManager;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-30 2:52
	 */
	public class DemonHolder extends HeroHolder
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_alive:Boolean = true;
		
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
			if ( m_alive == false ) return;
			
			switch( m_state )
			{
			case GameDefine.GameState_Peace:
				m_mover.SetActive( false );
				if ( MasterManager.Singleton.HitActor( m_mover ) == true )
				{
					m_mover.parent.addChildAt( m_mover, 0 );
					m_mover.PlayAni( AnimationDef.Ani_Die );
					m_alive = false;
					GlobalWork.EvilCnt --;
					PBE.soundManager.play( "../assets/Sound/SE/kill.mp3", "SE" );
				}
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