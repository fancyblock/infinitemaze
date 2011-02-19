package Interface 
{
	import com.pblabs.engine.entity.IEntity;
	import dataStruct.Beat;
	
	/**
	 * ...
	 * @author Hejiabin
	 */
	public interface IObjFactory 
	{
		function CreateObj( beat:Beat ):IEntity;
	}
	
}