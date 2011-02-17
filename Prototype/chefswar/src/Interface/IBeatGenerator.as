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
		
		function SetCanva( canva:Sprite ):void;
	}
	
}