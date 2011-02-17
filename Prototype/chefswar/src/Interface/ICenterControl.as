package Interface 
{
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ICenterControl 
	{
		function SetSoundPlayer( player:ISoundPlayer ):void;
		
		function AddComponent( comp:IUpdateable ):void;
		
		function ClearAllComponents():void;
		
		function Start():void;
		
		function Update():void;
		
		function Stop():void;
		
		function IsStopped():Boolean;
	}
	
}