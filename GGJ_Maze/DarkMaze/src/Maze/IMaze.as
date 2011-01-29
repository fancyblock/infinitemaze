package Maze 
{
	import Maze.Cell;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-29 0:15
	 */
	public interface IMaze 
	{
		function get WIDTH():int;
		
		function get HEIGHT():int;
		
		function GetCell( x:int, y:int ):Cell;
	}
	
}