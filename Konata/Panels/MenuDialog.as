package Konata.Panels
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import KO.KEntity;
	import KO.KSources;
	
	public class MenuDialog extends KEntity
	{
		public function MenuDialog()
		{
			this.bitmapW = 200;
			this.bitmapH = 32;
			
			draw(0,0);
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			super.draw(dc, alpha);
			var bmp1:BitmapData = KSources.getBitmap(1, 3, 9);
			var bmp2:BitmapData = KSources.getBitmap(1, 4, 9);
			var bmp3:BitmapData = KSources.getBitmap(1, 5, 9);
			
			var shape2:Shape = new Shape();
			shape2.graphics.beginBitmapFill(bmp2);
			shape2.graphics.drawRect(0, 0, this.bitmapW - bmp2.height * 2 , bmp2.height);
			shape2.graphics.endFill();
			
			var matrix2:Matrix = new Matrix();
			matrix2.tx = bmp3.height;			
			var matrix3:Matrix = new Matrix();
			matrix3.tx = this.bitmapW - bmp3.width;
			
			this.renderData.draw(bmp1);
			this.renderData.draw(shape2, matrix2);
			this.renderData.draw(bmp3,matrix3);
		}
	}
}












