package Mover 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface IMover 
	{
		function GetPosition():Point;
		
		function Redius():Number;
		
		function SetNextPosition( pos:Point ):void
		
		function GetNextPosition():Point;
		
		function Update():void;
	}
	
}