package Interface 
{
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface ISpace extends IUpdateable
	{
		function AddObject( obj:IObj ):void;
		
		function SetSize( wid:int, hei:int, len:int ):void;
	}
	
}