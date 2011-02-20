package LogicComponent 
{
	import com.pblabs.engine.entity.IEntity;
	import com.pblabs.engine.entity.PropertyReference;
	import com.pblabs.engine.PBE;
	import com.pblabs.rendering2D.SimpleShapeRenderer;
	import dataStruct.Beat;
	import Enums.FlyingObj;
	import Interface.IObjFactory;
	import LogicComponent.GameComponent.FlyingObjComponent;
	import LogicComponent.GameComponent.SpaceSpotComponent;
	/**
	 * ...
	 * @author Hejiabin
	 */
	public class BaseObjFactory implements IObjFactory 
	{
		//-------------------------------- static member ------------------------------------
		
		//-------------------------------- private member -----------------------------------
		
		//-------------------------------- public function ----------------------------------
		
		/**
		 * @desc	constructor of BaseObjFactory
		 */
		public function BaseObjFactory() 
		{
			PBE.templateManager.registerEntityCallback( FlyingObj.FO_CUP, _onCreateCup );
			PBE.templateManager.registerEntityCallback( FlyingObj.FO_DISH, _onCreateDish );
			PBE.templateManager.registerEntityCallback( FlyingObj.FO_KNIFE, _onCreateKnife );
		}
		
		/* INTERFACE Interface.IObjFactory */
		
		public function CreateObj(beat:Beat):IEntity 
		{
			var entity:IEntity;
			
			entity = PBE.templateManager.instantiateEntity( FlyingObj.FO_CUP );
			
			return entity;
		}
		
		//-------------------------------- private function ---------------------------------
		
		//-------------------------------- callback function --------------------------------
		
		private function _onCreateCup():IEntity
		{
			var entity:IEntity = PBE.allocateEntity();
			
			//flyingObj component
			var fo:FlyingObjComponent = new FlyingObjComponent();
			fo.PositionRef = new PropertyReference( "@SpaceSpot.POSITION" );
			entity.addComponent( fo, "FlyingObj" );
			
			//space component
			var spaceSpot:SpaceSpotComponent = new SpaceSpotComponent();
			entity.addComponent( spaceSpot, "SpaceSpot" );
			
			//render component	[temp]
			var render:SimpleShapeRenderer = new SimpleShapeRenderer();
			render.fillColor = 0xff000000;
			render.isCircle = true;
			render.lineSize = 0;
			render.lineColor = 0xff000000;
			render.radius = 15;
			render.scene = PBE.scene;
			render.positionProperty = new PropertyReference( "@SpaceSpot.SCREEN_POS" );
			render.scaleProperty = new PropertyReference( "@SpaceSpot.SCREEN_SCALE" );
			entity.addComponent( render, "Render" );
			
			return entity;
		}
		
		private function _onCreateDish():IEntity
		{
			var entity:IEntity = PBE.allocateEntity();
			
			//[unfinished]
			
			return entity;
		}
		
		private function _onCreateKnife():IEntity
		{
			var entity:IEntity = PBE.allocateEntity();
			
			//[unfinished]
			
			return entity;
		}
	}

}