package Mover 
{
	import Maze.ISpace;
	
	/**
	 * ...
	 * @author	Hejiabin
	 * @date	2011-1-29 0:51
	 */
	public interface IMoverController 
	{
		function AttachMover( mover:IMover ):void;
		
		function AttachSpace( space:ISpace ):void; 
		
		function Move( dir:int, distance:Number ):Boolean;
		
		function Update( timeLapse:Number ):void;
		
		function SetState( state:String ):void;
	}
	
}