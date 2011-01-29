package Mover 
{
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-30 1:13
	 */
	public interface IMaster 
	{
		function SlaveCount():int;
		
		function AddSlave( slave:IMover ):void;
		
		function RemoveSlave( slave:IMover ):void;
		
		function MasterFlag():Array;
		
		function GetIMover():IMover;
		
		function IsActived():Boolean;
		
		function SetActive( value:Boolean ):void;
	}
	
}