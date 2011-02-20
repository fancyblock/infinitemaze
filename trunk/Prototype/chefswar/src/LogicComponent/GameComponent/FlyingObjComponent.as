package LogicComponent.GameComponent 
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import dataStruct.ActionInfo;
	import dataStruct.Beat;
	import dataStruct.Point3D;
	import Enums.BeatFlag;
	import com.pblabs.engine.PBE;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class FlyingObjComponent extends TickedComponent 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- public member ------------------------------------
		
		public var SRC_SPOT:Point3D = null;
		public var DEST_SPOT:Point3D = null;
		
		public var PositionRef:PropertyReference = null;
		
		//-------------------------------- private member -----------------------------------
		
		private var m_beat:Beat = null;
		private var m_speed:Point3D = null;
		private var m_position:Point3D = null;
		
		private var m_gestureComponent:GestureRecoComponent = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of FlyingObjComponent
		 */
		public function FlyingObjComponent() 
		{
			super();
		}
		
		/**
		 * @desc	setter of the beat
		 */
		public function set BEAT( beat:Beat ):void
		{
			m_beat = beat;
		}
		
		/**
		 * @desc	tick function
		 * @param	deltaTime
		 */
		override public function onTick (deltaTime:Number) : void
		{
			super.onTick( deltaTime );
			
			//update the position
			m_position.AddToMe( m_speed.MulScalar( deltaTime ) );
			//set the position
			owner.setProperty( PositionRef, m_position );
			
			//if the object out of the space, destroy it
			if ( m_position._z < 0 )
			{
				if ( m_beat._flag == BeatFlag.eFlyingBeat )
				{
					//[unfinished]	play an animation on this position
					
					trace( "the flying object out of the space" );
				}
				
				this.owner.destroy();
			}
			else
			//if the object with in the hit range
			if ( m_position._z < GlobalWork.g_gameSetting.HitRange )
			{
				var curGest:ActionInfo = m_gestureComponent.GetGesture();
				
				if ( curGest != null )
				{
					//hitted
					if ( curGest._hitType == m_beat._type )
					{
						m_beat._flag = BeatFlag.eHitted;
						
						//[unfinished]	play an animation on this position
						
						trace( "the flying object hitted" );
						
						this.owner.destroy();
					}
				}
			}
			
		}
		
		//-------------------------------- private function ---------------------------------
		
		//callback when added
		override protected function onAdd () : void
		{
			super.onAdd();
			
			//get the initial position
			m_position = SRC_SPOT.Copy();
			//calculate the speed
			m_speed = DEST_SPOT.Sub( SRC_SPOT ).DivScalar( m_beat._endTime - m_beat._startTime );
			//set the initial position
			owner.setProperty( PositionRef, m_position );
			
			m_gestureComponent = PBE.lookupEntity( "GameLogic" ).lookupComponentByName( "GestureReconize" ) as GestureRecoComponent;
		}

		//callback when removed
		override protected function onRemove () : void
		{
			super.onRemove();
			
			//[unfinished]
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}