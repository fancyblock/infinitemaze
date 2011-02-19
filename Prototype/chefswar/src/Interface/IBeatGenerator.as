package Interface 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface IBeatGenerator extends IUpdateable
	{
		function SetBeatsBase( beatsBase:ISoundBeatsBase ):void;
		
		function SetSpace( space:ISpace ):void;
		
		function SetObjFactory( factory:IObjFactory ):void;
	}
	
}