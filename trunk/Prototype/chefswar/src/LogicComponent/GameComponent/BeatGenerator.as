package LogicComponent.GameComponent 
{
	import dataStruct.Beat;
	import Interface.IBeatGenerator;
	import Interface.IObj;
	import Interface.IObjFactory;
	import Interface.ISoundBeatsBase;
	import Interface.ISpace;
	import LogicComponent.BaseObjFactory;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BeatGenerator implements IBeatGenerator 
	{
	
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_beatsBase:ISoundBeatsBase = null;
		private var m_space:ISpace = null;
		private var m_objFactory:IObjFactory = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BeatGenerator
		 */
		public function BeatGenerator() 
		{
			//set default object factory
			m_objFactory = new BaseObjFactory();
		}
		
		/* INTERFACE Interface.IBeatGenerator */
		
		public function SetBeatsBase(beatsBase:ISoundBeatsBase):void 
		{
			m_beatsBase = beatsBase;
		}
		
		public function SetSpace( space:ISpace ):void
		{
			m_space = space;
		}
		
		public function SetObjFactory( factory:IObjFactory ):void
		{
			m_objFactory = factory;
		}
		
		public function Update(time:Number):void 
		{
			var curBeats:Array  = m_beatsBase.GetNewBeatsBefore( time );
			
			var len:int = curBeats.length;
			var beat:Beat;
			var obj:IObj;
			for ( var i:int = 0; i < len; i++ )
			{
				beat = curBeats[i] as Beat;
				
				//create the flying object
				obj = m_objFactory.CreateObj( beat );
				//add the obj to the space
				m_space.AddObject( obj );
				
				trace( "[new beat] type: " + beat._type );
			}
			
			//[unfinished]
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}