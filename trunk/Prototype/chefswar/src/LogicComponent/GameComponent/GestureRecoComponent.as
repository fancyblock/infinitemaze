package LogicComponent.GameComponent 
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import dataStruct.ActionInfo;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import GestureReco.gesture.GestureEvent;
	import GestureReco.gesture.MouseGesture;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GestureRecoComponent extends TickedComponent 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- public member ------------------------------------
		
		public var CUR_TIME:PropertyReference = null;
		
		//-------------------------------- private member -----------------------------------
		
		private var m_gestureReco:MouseGesture = null;
		private var m_slidePanel:Sprite = null;
		private var m_curAction:ActionInfo = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of GestureRecoComponent
		 */
		public function GestureRecoComponent() 
		{
			super();
		}
		
		/**
		 * @desc	call tick function
		 * @param	deltaTime
		 */
		override public function onTick (deltaTime:Number) : void
		{
			super.onTick( deltaTime );
			
			var cutTime:Number = this.owner.getProperty( CUR_TIME ) as Number;
			
			//[unfinished]
		}
		
		/**
		 * @desc	set the slidePanel
		 * @param	canva
		 */
		public function SetSlidePanel( canva:Sprite ):void
		{
			m_slidePanel = canva;
		}
		
		/**
		 * @desc	return the gestures
		 * @return
		 */
		public function GetGesture():ActionInfo
		{
			return m_curAction;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//callback when add
		override protected function onAdd () : void
		{
			super.onAdd();
			
			m_gestureReco = new MouseGesture( m_slidePanel );
			m_gestureReco.addEventListener( GestureEvent.GESTURE_MATCH, _onMatch );
			
			//[unfinished]
			
		}

		//callback when remove
		override protected function onRemove () : void
		{
			super.onRemove();
			
			//[unfinished]
		}
		
		//-------------------------------- callback function --------------------------------
		
		private function _onMatch( evt:GestureEvent ):void
		{
			//[unfinished]
		}
		
	}

}