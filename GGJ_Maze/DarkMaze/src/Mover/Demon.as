package Mover 
{
	import Define.GameDefine;
	import flash.geom.Point;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-30 2:50
	 */
	public class Demon extends Hero 
	{
		//-------------------------------- static member ------------------------------------
				
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of Demon
		 */
		public function Demon(profile:Class, pos:Point = null, redius:Number = 7) 
		{
			super(profile, pos, 10);
			
			m_slaveFlag = [new GlowFilter( 0x00ff00 )];
			m_type = GameDefine.MasterEvil;
			
			this.SetActive( false );
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}