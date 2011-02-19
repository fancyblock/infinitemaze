package LogicComponent 
{
	import com.pblabs.engine.resource.Resource;
	import com.pblabs.engine.resource.SoundResource;
	import dataStruct.Beat;
	import Interface.ISoundBeatsBase;
	import Interface.ISoundLoader;
	import Interface.ISoundPlayer;
	import com.pblabs.engine.PBE;
	import com.pblabs.engine.resource.XMLResource;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseSoundLoader implements ISoundLoader 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		private var m_soundPlayer:ISoundPlayer = null;
		private var m_beatsBase:ISoundBeatsBase = null;
		private var m_isLoadded:Boolean = false;
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseSoundLoader
		 */
		public function BaseSoundLoader() 
		{
			m_isLoadded = false;
		}
		
		/* INTERFACE Interface.ISoundLoader */
		
		public function SetSoundPlayer(player:ISoundPlayer):void 
		{
			m_soundPlayer = player;
		}
		
		public function SetBeatsBase(beatsBase:ISoundBeatsBase):void 
		{
			m_beatsBase = beatsBase;
		}
		
		public function LoadSound(soundInfoPath:String):Boolean 
		{
			m_isLoadded = false;
			
			PBE.resourceManager.load( soundInfoPath, XMLResource, _onLevelFileLoaded, _onLoadFail );
			
			return true;
		}
		
		public function IsLoadComplete():Boolean 
		{
			return m_isLoadded;
		}
		
		public function GetLoadProgress():Number 
		{
			//[unfinished]
			
			return 1;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
		private function _onLevelFileLoaded( res:XMLResource ):void
		{
			var data:XML = res.XMLData;
			
			//analysis xml
			//extract sound info
			var soundPath:String = data.SoundInfo.SoundName;
			var bpm:Number = data.SoundInfo.BPM;
			var offset:Number = data.SoundInfo.Offset;
			offset = offset / 1000.0;
			
			//extract beats info
			var beatsXml:XMLList = data.BeatInfo.children();
			var beat:Beat;
			var len:int = beatsXml.length();
			for ( var i:int = 0; i < len; i++ )
			{
				beat = new Beat();
				
				//get the info from xml
				beat._startPos = beatsXml[i].appearBeat;
				beat._endPos = beatsXml[i].hitBeat;
				beat._type = beatsXml[i].hitType;
				beat._dropPoint = beatsXml[i].dropPoint;
				
				//calculate info
				beat._startTime = 60.0 * beat._startPos / bpm + offset;
				beat._endTime = 60.0 * beat._endPos / bpm + offset;
				
				m_beatsBase.AddBeat( beat );
			}
			
			m_beatsBase.Reset();
			
			//load the sound
			PBE.resourceManager.load( soundPath, SoundResource, _onSndLoadded, _onLoadFail );
			
		}
		
		private function _onSndLoadded( res:SoundResource ):void
		{
			m_soundPlayer.SetSound( res.soundObject );
			
			m_isLoadded = true;
		}
		
		private function _onLoadFail( res:Resource ):void
		{
			throw new Error( "[Error]: BaseSoundLoader , resource load fail" );
		}
		
	}

}