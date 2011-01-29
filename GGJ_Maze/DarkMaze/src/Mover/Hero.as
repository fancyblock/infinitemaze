package Mover 
{
	import Define.GameDefine;
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
		
		protected var m_slaves:Array = null;
		protected var m_slaveFlag:Array = null;
		protected var m_type:String = null;
		
		protected var m_tracePath:Array = null;
		protected var m_active:Boolean = true;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Hero
		 */
		public function Hero(profile:Class, pos:Point = null, redius:Number = 7) 
		{
			super(profile, pos, redius);
			
			m_slaves = new Array();
			m_slaveFlag = [new GlowFilter( 0xff0000 )];
			m_type = GameDefine.MasterHero;
			
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
			
			for ( var i:int = 0; i < 8; i++ ) m_tracePath.pop();
		}
		
		public function MasterFlag():Array
		{
			return m_slaveFlag;
		}
		
		public function MasterType():String
		{
			return m_type;
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
		
		public function IsActived():Boolean
		{
			return m_active;
		}
		
		public function SetActive( value:Boolean ):void
		{
			m_active = value;
		}
		
		//-------------------------------- private function ---------------------------------
		
		override protected function positionUpdated():void
		{
			this.UpdateSlavePosition();
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}