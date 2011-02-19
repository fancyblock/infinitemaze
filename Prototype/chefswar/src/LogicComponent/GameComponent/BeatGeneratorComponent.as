package LogicComponent.GameComponent 
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import dataStruct.Beat;
	import Interface.IObjFactory;
	import Interface.ISoundBeatsBase;
	import LogicComponent.BaseObjFactory;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BeatGeneratorComponent extends TickedComponent
	{
	
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_curTime:PropertyReference = null;
		private var m_beatsBase:ISoundBeatsBase = null;
		private var m_objFactory:IObjFactory = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BeatGenerator
		 */
		public function BeatGeneratorComponent() 
		{
			//set default object factory
			m_objFactory = new BaseObjFactory();
		}
		
		/**
		 * @desc	setter
		 */
		public function set CUR_TIME( curTime:PropertyReference ):void
		{
			m_curTime = curTime;
		}
		
		/**
		 * @desc	set beats base
		 * @param	beatsBase
		 */
		public function SetBeatsBase(beatsBase:ISoundBeatsBase):void 
		{
			m_beatsBase = beatsBase;
		}
		
		/**
		 * @desc	set beats factory
		 * @param	factory
		 */
		public function SetObjFactory( factory:IObjFactory ):void
		{
			m_objFactory = factory;
		}
		
		/**
		 * @desc	tick function
		 * @param	deltaTime
		 */
		override public function onTick (deltaTime:Number) : void
		{
			var curTime:Number = this.owner.getProperty( m_curTime );
			var curBeats:Array  = m_beatsBase.GetNewBeatsBefore( curTime );
			
			var len:int = curBeats.length;
			var beat:Beat;
			var obj:IEntity;
			for ( var i:int = 0; i < len; i++ )
			{
				beat = curBeats[i] as Beat;
				
				//create the flying object
				obj = m_objFactory.CreateObj( beat );
				//set the object property
				//[unfinished]
				
				trace( "[new beat] type: " + beat._type );
			}
			
			//[unfinished]
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}