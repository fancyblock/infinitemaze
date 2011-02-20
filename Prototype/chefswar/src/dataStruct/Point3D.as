package dataStruct 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class Point3D 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		public var _x:Number = 0;
		public var _y:Number = 0;
		public var _z:Number = 0;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Point3D
		 */
		public function Point3D( x:Number = 0, y:Number = 0, z:Number = 0 )
		{
			_x = x;
			_y = y;
			_z = z;
		}
		
		/**
		 * @desc	
		 * @return
		 */
		public function GetLength():Number
		{
			return Math.sqrt( _x * _x + _y * _y + _z * _z );
		}
		
		/**
		 * @desc	add operaction
		 * @param	pt
		 * @return
		 */
		public function AddToMe( pt:Point3D ):Point3D
		{
			this._x += pt._x;
			this._y += pt._y;
			this._z += pt._z;
			
			return this;
		}
		
		/**
		 * @desc	sub operaction
		 * @param	pt
		 * @return
		 */
		public function Sub( pt:Point3D ):Point3D
		{
			return new Point3D( this._x - pt._x, this._y - pt._y, this._z - pt._z );
		}
		
		/**
		 * @desc	div operaction
		 * @param	value
		 * @return
		 */
		public function DivScalar( value:Number ):Point3D
		{
			return new Point3D( this._x / value, this._y / value, this._z / value );
		}
		
		/**
		 * @desc	mul operaction
		 * @param	value
		 * @return
		 */
		public function MulScalar( value:Number ):Point3D
		{
			return new Point3D( this._x * value, this._y * value, this._z * value );
		}
		
		/**
		 * @desc	copy me
		 * @return
		 */
		public function Copy():Point3D
		{
			return new Point3D( this._x, this._y, this._z );
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}