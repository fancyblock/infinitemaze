package Mover 
{
	import com.pblabs.engine.PBE;
	import Define.GameDefine;
	import flash.geom.Point;
	import Manager.MasterManager;
	import Maze.ISpace;
	import Mover.IMover;
	import Define.DirectionDef;
	import Define.AnimationDef;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011/1/29 16:39
	 */
	public class HumanHolder implements IMoverController 
	{
		//-------------------------------- static member ---------------------------------
		
		//-------------------------------- private member --------------------------------
		
		private var m_mover:Human = null;
		private var m_space:ISpace = null;
		
		private var m_state:String = null;
		
		private var m_master:IMaster = null;
		
		private var m_curDir:int = -1;
		
		//-------------------------------- public function --------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function HumanHolder() 
		{
		}
		
		/* INTERFACE Mover.IMoverController */
		
		public function AttachMover(mover:IMover):void 
		{
			m_mover = mover as Human;
		}
		
		public function AttachSpace(space:ISpace):void 
		{
			m_space = space;
		}
		
		public function Move(dir:int, distance:Number):Boolean 
		{
			var curPos:Point = m_mover.GetPosition();
			var nextPos:Point = new Point( curPos.x, curPos.y );
			
			switch( dir )
			{
			case DirectionDef.DIR_0:
				nextPos.y -= distance;
				m_mover.PlayAni( AnimationDef.Ani_Dir0 );
				break;
			case DirectionDef.DIR_3:
				nextPos.x += distance;
				m_mover.PlayAni( AnimationDef.Ani_Dir3 );
				break;
			case DirectionDef.DIR_6:
				nextPos.y += distance;
				m_mover.PlayAni( AnimationDef.Ani_Dir6 );
				break;
			case DirectionDef.DIR_9:
				nextPos.x -= distance;
				m_mover.PlayAni( AnimationDef.Ani_Dir9 );
				break;
			default:
				break;
			}
			
			m_mover.SetNextPosition( nextPos );
			if ( m_space.IsHitWall( m_mover ) == true )
			{
				return false;
			}
			
			m_mover.Update();
			
			return true;
		}
		
		public function Update(timeLapse:Number):void 
		{
			var master:IMaster = MasterManager.Singleton.HitMaster( m_mover );
			
			// follow the new master
			if ( master != null && master.IsActived() && master != m_master )
			{
				if ( m_master != null )
				{
					unfollow( m_master );
				}
				
				m_master = master;
				follow( master );
			}
			
			if ( m_master == null )
			{
				hangOut();
			}
		}
		
		public function SetState( state:String ):void
		{
			m_state = state;
		}
		
		//-------------------------------- private function --------------------------------
		
		// follow master
		private function follow( master:IMaster ):void
		{
			master.AddSlave( m_mover );
			m_mover.filters = master.MasterFlag();
			
			if ( master.MasterType() == GameDefine.MasterHero )
			{
				PBE.soundManager.play( "../assets/Sound/SE/join.mp3", "SE" );
			}
			
			if ( master.MasterType() == GameDefine.MasterEvil )
			{
				GlobalWork.EvilManCnt ++;
			}
			else
			{
				GlobalWork.YourManCnt ++;
			}
		}
		
		// unfollow master
		private function unfollow( master:IMaster ):void
		{
			master.RemoveSlave( m_mover );
			m_mover.filters = null;
			
			if ( master.MasterType() == GameDefine.MasterEvil )
			{
				GlobalWork.EvilManCnt --;
			}
			else
			{
				GlobalWork.YourManCnt --;
			}
		}
		
		//hang out
		private function hangOut():void
		{
			if ( m_curDir == -1 )
			{
				m_curDir = getRandDir();
			}
			
			if ( this.Move( m_curDir, GameDefine.EvilVelocity ) == false )
			{
				m_curDir = getNextDir();
			}
		}
		
		//return next direction
		private function getNextDir():int
		{
			var dir:int;
			
			var randS:Number = Math.random();
			
			switch( m_curDir )
			{
			case DirectionDef.DIR_0:
				dir = randS > 0.5 ? DirectionDef.DIR_9 : DirectionDef.DIR_3;
				break;
			case DirectionDef.DIR_3:
				dir = randS > 0.5 ? DirectionDef.DIR_0 : DirectionDef.DIR_6;
				break;
			case DirectionDef.DIR_6:
				dir = randS > 0.5 ? DirectionDef.DIR_3 : DirectionDef.DIR_9;
				break;
			case DirectionDef.DIR_9:
				dir = randS > 0.5 ? DirectionDef.DIR_6 : DirectionDef.DIR_0;
				break;
			default:
				dir = DirectionDef.DIR_0;
				break;
			}
			
			return dir;
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
		
		//-------------------------------- callback function -------------------------------
		
	}

}