package Maze 
{
	import flash.geom.Point;
	import Mover.IMover;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISpace 
	{
		function IsConnected( src:Point, dest:Point ):Boolean;
		
		function IsHitWall( pos:IMover ):Boolean;
	}
	
}