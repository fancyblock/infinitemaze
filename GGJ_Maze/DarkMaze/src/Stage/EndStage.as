package Stage 
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-29 1:28
	 */
	public class EndStage extends BaseUIScreen 
	{
		//-------------------------------- static member ------------------------------------
			
		//-------------------------------- private member -----------------------------------
		
		private var m_txtResultInfo:TextField = null;
		private var m_addInfo:TextField = null;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of EndStage
		 */
		public function EndStage() 
		{
			super( "" );
			
			//set the ui bgm
			this.UI_BGM = "../assets/Sound/BGM/GameBgm.mp3";
			
			//load the ui
			this.embedUI( new EndUI() );
		}
		
		//-------------------------------- private function ---------------------------------
		
		//initial the ui
		override protected function initialUI():void
		{
			addChild( UI_ROOT );
			
			m_txtResultInfo = UI_ROOT.getChildByName( "txtResultInfo" ) as TextField;
			m_txtResultInfo.autoSize = TextFieldAutoSize.CENTER;
			m_addInfo = new TextField();
			UI_ROOT.addChild( m_addInfo );
			m_addInfo.x = m_txtResultInfo.x;
			m_addInfo.y = m_txtResultInfo.y + m_txtResultInfo.height + 20;
			m_addInfo.selectable = false;
			m_addInfo.textColor = 0xf00000;
			m_addInfo.autoSize = TextFieldAutoSize.CENTER;
			m_addInfo.width = m_txtResultInfo.width;
			m_addInfo.defaultTextFormat = m_txtResultInfo.defaultTextFormat;
			
		}
		
		//enter this stage
		override protected function onEnter():void
		{
			m_txtResultInfo.text = GlobalWork.ResultInfo;
			
			if ( GlobalWork.ResultInfo == "You Escape" )
			{
				m_addInfo.text = "You saved " + GlobalWork.YourManCnt + " persons";
			}
		}
		
		//-------------------------------- callback function --------------------------------
		
	}

}