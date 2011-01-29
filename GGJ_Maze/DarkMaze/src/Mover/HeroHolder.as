package Mover 
{
	import Define.DirectionDef;
	import Define.GameDefine;
	import flash.geom.Point;
	import Maze.ISpace;
	import Mover.IMover;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.core.InputKey;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-29 1:24
	 */
	public class HeroHolder implements IMoverController 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_mover:IMover = null;
		private var m_space:ISpace = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of HeroHolder
		 */
		public function HeroHolder() 
		{
		}
		
		/* INTERFACE Mover.IMoverController */
		
		public function AttachMover(mover:IMover):void 
		{
			m_mover = mover;
		}
		
		public function AttachSpace( space:ISpace ):void
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
				break;
			case DirectionDef.DIR_3:
				nextPos.x += distance;
				break;
			case DirectionDef.DIR_6:
				nextPos.y += distance;
				break;
			case DirectionDef.DIR_9:
				nextPos.x -= distance;
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
		
		public function Update( timeLapse:Number ):void
		{
			if ( PBE.isKeyDown( InputKey.W ) == true )
			{
				Move( DirectionDef.DIR_0, GameDefine.HeroVelocity );
			}
			else if ( PBE.isKeyDown( InputKey.S ) == true )
			{
				Move( DirectionDef.DIR_6, GameDefine.HeroVelocity );
			}
			else if ( PBE.isKeyDown( InputKey.A ) == true )
			{
				Move( DirectionDef.DIR_9, GameDefine.HeroVelocity );
			}
			else if ( PBE.isKeyDown ( InputKey.D ) == true )
			{
				Move( DirectionDef.DIR_3, GameDefine.HeroVelocity );
			}
		}
		
		public function SetState( state:String ):void
		{
			//[unfinished]
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}