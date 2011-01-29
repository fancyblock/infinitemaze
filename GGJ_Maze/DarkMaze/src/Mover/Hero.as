package Mover 
{
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-30 1:17
	 */
	public class Hero extends Human implements IMaster 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		private var m_slaves:Array = null;
		private var m_slaveFlag:Array = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Hero
		 */
		public function Hero(profile:Class, pos:Point = null, redius:Number = 7) 
		{
			super(profile, pos, redius);
			
			m_slaves = new Array();
			m_slaveFlag = [new GlowFilter( 0xff0000 )];
		}
		
		/* INTERFACE Mover.IMaster */
		
		public function SlaveCount():int 
		{
			return m_slaves.length;
		}
		
		public function AddSlave( slave:IMover ):void
		{
			m_slaves.push( slave );
		}
		
		public function RemoveSlave( slave:IMover ):void
		{
			var index:int = m_slaves.lastIndexOf( slave );
			
			m_slaves.splice( index, 1 );
		}
		
		public function MasterFlag():Array
		{
			return m_slaveFlag;
		}
		
		public function GetIMover():IMover
		{
			return this;
		}
		
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}