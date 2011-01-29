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
		
		private var m_tracePath:Array = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Hero
		 */
		public function Hero(profile:Class, pos:Point = null, redius:Number = 7) 
		{
			super(profile, pos, redius);
			
			m_slaves = new Array();
			m_slaveFlag = [new GlowFilter( 0xff0000 )];
			
			m_tracePath = new Array();
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
		
		public function UpdateSlavePosition():void
		{
			m_tracePath.push( new Point( this.x, this.y ) );
			
			var count:int = this.SlaveCount();
			if ( m_tracePath.length > count * 8 )
			{
				m_tracePath.shift();
			}
			
			var slave:IMover;
			for ( var i:int = 0; i < count; i++ )
			{
				slave = m_slaves[i] as IMover;
				
				slave.SetNextPosition( m_tracePath[i * 8] );
				slave.Update();
			}
		}
		
		//-------------------------------- private function ---------------------------------
		
		override protected function positionUpdated():void
		{
			this.UpdateSlavePosition();
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}