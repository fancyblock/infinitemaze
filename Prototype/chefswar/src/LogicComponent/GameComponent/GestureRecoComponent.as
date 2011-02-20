package LogicComponent.GameComponent 
{
	import com.pblabs.engine.components.TickedComponent;
	import com.pblabs.engine.entity.PropertyReference;
	import dataStruct.ActionInfo;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import GestureReco.gesture.GestureEvent;
	import GestureReco.gesture.MouseGesture;
	import com.pblabs.engine.PBE;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class GestureRecoComponent extends TickedComponent 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- public member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_drawing:Boolean = false;
		private var m_gestureReco:MouseGesture = null;
		private var m_slidePanel:Sprite = null;
		private var m_curAction:ActionInfo = null;
		
		private var m_gestExist:int = 0;
		
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
			
			//draw the trace of gesture
			if ( m_drawing == true )
			{
				m_slidePanel.graphics.lineTo( PBE.mainClass.mouseX, PBE.mainClass.mouseY );
			}
			
			//[temp]
			if ( m_gestExist == 0 )
			{
				if ( m_curAction != null )
				{
					m_gestExist ++;
				}
			}
			else if( m_gestExist > 1 )
			{
				m_gestExist = 0;
				m_curAction = null;
			}
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
			
			//initial gesture reconize
			m_gestureReco = new MouseGesture( m_slidePanel );
			m_gestureReco.addEventListener( GestureEvent.GESTURE_MATCH, _onMatch );
			m_gestureReco.addEventListener( GestureEvent.START_CAPTURE, _onStartCap );
			m_gestureReco.addEventListener( GestureEvent.STOP_CAPTURE, _onStopCap );
			
			//add gesture
			var len:int = GlobalWork.g_gameSetting.AllGestures.length;
			var act:ActionInfo = null;
			for ( var i:int = 0; i < len; i++ )
			{
				act = GlobalWork.g_gameSetting.AllGestures[i] as ActionInfo;
				m_gestureReco.addGesture( act, act._gestureCode );
			}
			
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
			m_curAction = evt.datas as ActionInfo;
		}
		
		private function _onStartCap( evt:GestureEvent ):void
		{
			m_drawing = true;
			
			m_slidePanel.graphics.lineStyle( 4, 0x444444 );
			m_slidePanel.graphics.moveTo( PBE.mainClass.mouseX, PBE.mainClass.mouseY );

		}
		
		private function _onStopCap( evt:GestureEvent ):void
		{
			m_drawing = false;
			
			m_slidePanel.graphics.clear();
		}
		
	}

}