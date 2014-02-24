package KO {
	import flash.display.BlendMode;
	import flash.utils.Dictionary;
	
	public class KEntityGroup extends KEntity {
		
		public var entityList:Array;
		
		public function KEntityGroup() {
			entityList = [];
		}
		
		public function addEntity(entiry:KEntity):void {
			entityList.push(entiry);
		}
		
		public function update():void {
			var entity:KEntity;
			var index:int = entitys.length;
			while (index--) {
				entity = entityList[index] as KEntity;
				KHitDetector.ScanningLayer(entity);
				entity.update();
			}
			return;
		}
		
		public function render():void {
			var count:int = entityList.length;
			var index:int = 0;
			while (index < count) {
				K.game.RenderHelper(entityList[index++] as KEntity);
			}
			return;
		}
	}
}