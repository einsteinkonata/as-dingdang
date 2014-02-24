package Konata.Backgrounds {
	import KO.KEntity;
	import KO.KSources;
	
	/**
	 * ...
	 * @author aa
	 */
	public class SceneA extends KEntity{
		
		public function SceneA() {
			draw();
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void {
			this.renderData = KSources.getBitmap(3);
		}
	}
}