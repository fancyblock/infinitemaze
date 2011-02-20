package LogicComponent.GameComponent 
{
	import com.pblabs.engine.entity.EntityComponent;
	import dataStruct.Point3D;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class SpaceSpotComponent extends EntityComponent 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_position:Point3D = new Point3D();
		private var m_screenPos:Point = new Point();
		private var m_screenScale:Number = 1;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of SpaceSpotComponent
		 */
		public function SpaceSpotComponent() 
		{
			super();
		}
		
		/**
		 * @desc	getter of the position
		 */
		public function get POSITION():Point3D
		{
			return m_position;
		}
		
		/**
		 * @desc	setter of the position
		 */
		public function set POSITION( pt:Point3D ):void
		{
			m_position._x = pt._x;
			m_position._y = pt._y;
			m_position._z = pt._z;
			
			projectionCalc();
		}
		
		/**
		 * @desc	getter of the screen position
		 */
		public function get SCREEN_POS():Point
		{
			return m_screenPos;
		}
		
		/**
		 * @desc	setter of the screen position
		 */
		public function set SCREEN_POS( pt:Point ):void
		{
			m_screenPos.x = pt.x;
			m_screenPos.y = pt.y;
		}
		
		/**
		 * @desc	getter of the scale
		 */
		public function get SCREEN_SCALE():Number
		{
			return m_screenScale;
		}
		
		/**
		 * @desc	setter of the scale
		 */
		public function set SCREEN_SCALE( value:Number ):void
		{
			m_screenScale = value;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//calculate
		private function projectionCalc():void
		{
			m_screenPos.x = m_position._x;		//[temp]
			m_screenPos.y = m_position._y;
			
			//m_screenScale = ( 800.0 - m_position._z ) / 800.0;

			//[unfinished]
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}