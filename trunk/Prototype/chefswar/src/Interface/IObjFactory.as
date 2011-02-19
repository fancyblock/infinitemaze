package Interface 
{
	import dataStruct.Beat;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface IObjFactory 
	{
		function CreateObj( beat:Beat ):IObj;
	}
	
}