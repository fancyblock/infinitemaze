package LogicComponent 
{
	import Interface.IObj;
	import Interface.ISpace;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class SpaceComponent implements ISpace 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_objectList:Array = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of SpaceComponent
		 */
		public function SpaceComponent() 
		{
			m_objectList = new Array();
		}
		
		/* INTERFACE Interface.ISpace */
		
		public function AddObject(obj:IObj):void 
		{
			//[unfinished]
		}
		
		public function SetSize(wid:int, hei:int, len:int):void 
		{
			//[unfinished]
		}
		
		public function Update(time:Number):void 
		{
			//[unfinished]
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
	}

}