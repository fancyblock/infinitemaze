package Stages 
{
	import caurina.transitions.Tweener;
	import com.pblabs.engine.PBE;
	import com.pblabs.screens.BaseScreen;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author	Hejiabin
	 */
	public class BaseUIScreen extends BaseScreen 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_uiRoot:MovieClip = null;
		private var m_nextScreen:String = null;
		private var m_uiBGM:String = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor
		 * @param	image
		 */
		public function BaseUIScreen() 
		{
			super();
		}
		
		/**
		 * @desc	invoke when screen show
		 */
		override public function onShow () : void
		{
			super.onShow();
			
			enableControl( true );
			
			//play the bgm
			if ( m_uiBGM != null ) PBE.soundManager.play( m_uiBGM, "BGM", 0, 100 );
			
			onEnter();
		}
		
		/**
		 * @desc	invoke when screen hide
		 */
		override public function onHide () : void
		{
			super.onHide();
			
			//stop the bgm
			PBE.soundManager.stopCategorySounds( "BGM" );
			
			this.alpha = 1;
		}
		
		//-------------------------------- private function ---------------------------------
		
		/**
		 * @desc	set all the controls in this ui enable or disable
		 * @param	enable
		 */
		protected function enableControl( enable:Boolean ):void
		{
			if ( m_uiRoot == null ) return;
			
			for each( var control:DisplayObject in m_uiRoot )
			{
				if ( control is Sprite )
				{
					( control as Sprite ).mouseEnabled = enable;
				}
				
				if ( control is SimpleButton )
				{
					( control as SimpleButton ).mouseEnabled = enable;
				}
			}
		}
		
		/**
		 * @desc	load the ui MovieClip
		 * @param	uiPath
		 */
		protected function embedUI( ui:MovieClip ):void
		{
			m_uiRoot = ui;
			
			initialUI();
		}
		
		/**
		 * @desc	set se on a button
		 * @param	btn
		 * @param	add
		 */
		protected function SetMouseOverSnd( btn:SimpleButton, add:Boolean = true ):void
		{
			if ( add == true )
			{
				btn.addEventListener( MouseEvent.MOUSE_OVER, _onButtonMouseOver );
			}
			else
			{
				btn.removeEventListener( MouseEvent.MOUSE_OVER, _onButtonMouseOver );
			}
		}
		
		/**
		 * @desc	getter  ui
		 */
		protected function get UI_ROOT():MovieClip	{ return m_uiRoot; }
		
		/**
		 * @desc	setter bgm
		 */
		protected function set UI_BGM( bgm:String ):void { m_uiBGM = bgm; }
		
		/**
		 * @desc	fade out this screen and goto the next screen
		 * @param	nextScreen
		 */
		protected function FadeOutToScreen( nextScreen:String ):void
		{
			onLeave();
			
			enableControl( false );
			
			m_nextScreen = nextScreen;
			
			Tweener.addTween( this, { alpha:0, time:1, transition:"linear", onComplete:_onDisappear } );
		}
		
		/**
		 * @desc	switch to next screen
		 * @param	nextScreen
		 */
		protected function GotoScreen( nextScreen:String ):void
		{
			onLeave();
			
			enableControl( false );
			
			m_nextScreen = nextScreen;
			
			_onDisappear();
		}
		
		//initial the ui
		protected function initialUI():void {}
		
		//enter callback
		protected function onEnter():void {}
		
		//leave callback
		protected function onLeave():void {}
		
		//-------------------------------- callback function --------------------------------
		
		//play the se when mouse over
		private function _onButtonMouseOver( evt:MouseEvent ):void
		{
			throw new Error( "[Error] this func has not be implemented" );
		}
		
		//callback when screen disappear
		private function _onDisappear():void
		{
			PBE.screenManager.pop();
			
			PBE.screenManager.push( m_nextScreen );
		}

	}

}