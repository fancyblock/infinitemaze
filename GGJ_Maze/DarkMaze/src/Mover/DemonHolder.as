package Mover 
{
	import com.pblabs.engine.PBE;
	import Define.AnimationDef;
	import Define.DirectionDef;
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
		
		private var m_curDir:int = -1;
		private var m_lastDir:int = -1;
		
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
					GlobalWork.HeroDie = true;
					MasterManager.Singleton.GetActor().GetIMover().PlayAni( AnimationDef.Ani_Die );
					PBE.soundManager.play( "../assets/Sound/SE/kill.mp3", "SE" );
				}
				hangOut();
				break;
			default:
				break;
			}
		}
		
		//-------------------------------- private function ---------------------------------
		
		//hang out
		private function hangOut():void
		{
			if ( m_curDir == -1 )
			{
				m_curDir = getRandDir();
			}
			
			if ( this.Move( m_curDir, GameDefine.EvilVelocity ) == false )
			{
				m_curDir = getRandDir();
			}
		}
		
		//return a random direction
		private function getRandDir():int
		{
			var dir:int;
			
			switch( int( Math.random() * 4 ) )
			{
			case 1:
				dir = DirectionDef.DIR_0;
				break;
			case 2:
				dir = DirectionDef.DIR_3;
				break;
			case 3:
				dir = DirectionDef.DIR_6;
				break;
			case 4:
				dir = DirectionDef.DIR_9;
				break;
			default:
				dir = DirectionDef.DIR_0;
				break;
			}
			
			return dir;
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}