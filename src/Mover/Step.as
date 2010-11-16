package Mover
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2010.11.15
	 */
	public class Step 
	{
		//------------------------------------- private member --------------------------------------
		
		private var m_vec:Point = new Point();
		
		//------------------------------------- public function -------------------------------------
		
		/**
		 * @desc	constructor
		 * @param	x
		 * @param	y
		 */
		public function Step( x:Number = 0, y:Number = 0 )
		{
			m_vec.x = x;
			m_vec.y = y;
		}
		
		/**
		 * @desc	set the step
		 * @param	angle ( clock dir )
		 * @param	distance
		 */
		public function SetStep( angle:Number, distance:Number ):void
		{
			//[unfinished]
		}
		
		/**
		 * @desc	return the x offset
		 * @return
		 */
		public function GetX():Number
		{
			return m_vec.x;
		}
		
		/**
		 * @desc	return the y offset
		 * @return
		 */
		public function GetY():Number
		{
			return m_vec.y;
		}
		
		/**
		 * @desc	return the offset
		 * @return
		 */
		public function GetPosition():Point
		{
			return m_vec;
		}
		
	}

}