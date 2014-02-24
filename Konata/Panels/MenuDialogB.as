package Konata.Panels 
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import KO.KEntity;
	import KO.KSources;
	
	public class MenuDialogB extends KEntity 
	{
		public function MenuDialogB(x:Number,y:Number)
		{
			super(x, y);
			this.bitmapW = 80;
			this.bitmapH = 80;
			
			draw(0,0);
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			super.draw(dc, alpha);
			var bmp1:BitmapData = KSources.getBitmap(4, 0, 5);//7
			var bmp2:BitmapData = KSources.getBitmap(4, 2, 5);//9
			var bmp3:BitmapData = KSources.getBitmap(4, 0, 7);//1
			var bmp4:BitmapData = KSources.getBitmap(4, 2, 7);//3			
			var bmp5:BitmapData = KSources.getBitmap(4, 1, 5);//8
			var bmp6:BitmapData = KSources.getBitmap(4, 1, 7);//2
			var bmp7:BitmapData = KSources.getBitmap(4, 0, 6);//4
			var bmp8:BitmapData = KSources.getBitmap(4, 2, 6);//6			
			var bmp9:BitmapData = KSources.getBitmap(4, 1, 6);//5
			
			var matrix:Matrix = new Matrix();
			var i:int, j:int;
			var countX = (this.bitmapW / bmp1.width);
			var countY = (this.bitmapH / bmp1.height);
			for (i = 0; i < countX; i++ ) {
				for (j = 0; j < countY; j++ ) {					
					if(i > 0 && i < countX -1){
						if (j == 0){
							matrix.tx = i * bmp1.width;
							matrix.ty = 0;
							this.renderData.draw(bmp5, matrix);
						}else if (j == countY - 1) {
							matrix.tx = i * bmp1.width;
							matrix.ty = j * bmp1.height;
							this.renderData.draw(bmp6, matrix);
						}
						//
					}else if (j > 0 && j < countY - 1) {						
						if(i == 0){
							matrix.tx = 0;
							matrix.ty = j * bmp1.height;
							this.renderData.draw(bmp7, matrix);
						}else if(i == countX - 1){
							matrix.tx = i * bmp1.width;
							matrix.ty = j * bmp1.height;
							this.renderData.draw(bmp8, matrix);
						}
					}
					if (i > 0 && i < countX -1 && j > 0 && j < countY - 1) {
						matrix.tx = i * bmp1.width;
						matrix.ty = j * bmp1.height;
						this.renderData.draw(bmp9, matrix);
					}
				}
			}
			
			matrix = new Matrix();			
			this.renderData.draw(bmp1);
			matrix.tx = this.bitmapW - bmp1.width;
			this.renderData.draw(bmp2, matrix);
			matrix.tx = 0;
			matrix.ty = this.bitmapH - bmp1.height;
			this.renderData.draw(bmp3, matrix);
			matrix.tx = this.bitmapW - bmp1.width;
			matrix.ty = this.bitmapH - bmp1.height;
			this.renderData.draw(bmp4, matrix);
		}
	}
}