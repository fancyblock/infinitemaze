package LogicComponent.GameComponent 
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import dataStruct.Beat;
	import dataStruct.Point3D;
	import Enums.BeatFlag;
	
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
			
			//if the object with in the hit range
			if ( m_position._z < GlobalWork.g_gameSetting.HitRange )
			{
				//[unfinished]
			}
			
			//if the object out of the space, destroy it
			if ( m_position._z < 0 )
			{
				if ( m_beat._flag == BeatFlag.eFlyingBeat )
				{
					//[unfinished]	play an animation on this position
				}
				
				this.owner.destroy();
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
			
			//[unfinished]
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