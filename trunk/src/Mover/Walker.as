package Mover
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2010.11.09
	 */
	public class Walker extends Sprite 
	{
		//--------------------------------- private member ----------------------------------
		
		private var m_position:Point = new Point();
		private var m_velocity:Number = 0;
		
		//--------------------------------- public function ---------------------------------
		
		/**
		 * @desc	constructor
		 */
		public function Walker() 
		{
			super();
			
			m_velocity = 2.0;
		}
		
		/**
		 * @desc	return the position of this walker
		 * @return
		 */
		public function GetPosition():Point
		{
			return m_position;
		}
		
		/**
		 * @desc	move a step
		 * @param	distance
		 */
		public function MoveTo( distance:Step ):void
		{
			m_position.x += distance.GetX();
			m_position.y += distance.GetY();
		}
		
		/**
		 * @desc	try to move a step ( don't move ), return the dest position
		 * @param	distance
		 * @return
		 */
		public function TryMoveTo( distance:Step ):Point
		{
			var dest:Point = new Point();
			
			dest.x = m_position.x + distance.GetX();
			dest.y = m_position.y + distance.GetY();
			
			return dest;
		}
		
		//--------------------------------- private function --------------------------------
		
	}

}