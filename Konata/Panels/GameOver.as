package Konata.Panels 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import KO.K;
	import KO.KEntity;
	import KO.KHit;
	import KO.KInput;
	import KO.KSources;
	import Konata.G;
	import Konata.Game;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;
	import Konata.TextHelper;
	
	public class GameOver extends KEntity 
	{
		private var padding:int = G.Size16;
		private var menu:BitmapData;
		private var button1Up:BitmapData;
		private var button1Down:BitmapData;
		private var buttonText:BitmapData;
		private var button1Rect:Rectangle;
		private var button1Matrix:Matrix;
		private var button1MatrixText:Matrix;
		
		
		private var endLv:String;
		private var endTime:String;
		private var endPoint:String;
		// lv  point
		private var viewIndex:int = 0;
		private var viewMax:int = 15;
		public function GameOver()
		{
			this.bitmapW = 11 * G.Size16;
			this.bitmapH = 9 * G.Size16;
			this.x = (G.AndW - this.bitmapW) / 2;
			this.y = 80;
			
			endLv = CGame.Level.toString();
			endTime = Math.floor(CGame.timer).toString();
			endPoint = CGame.point.toString();
			
			draw(0, 0);
			InitText();
			InitButton();
			InitMenu();
		}
		
		private function InitText():void
		{
			buttonText = TextHelper.TextToDraw("return", G.Size8);
		}
		override public function update():void
		{
			DrawMenu();
			DrawGameOver();
			DrawMessage();
			if (KInput.mouseUp == true
			&& KHit.RectHitXY(button1Rect, KInput.mouseX,KInput.mouseY) == true) {
				KInput.mouseUp = false;
				Game.T.Op();
			}
		}
		
		private function DrawMessage():void
		{
			if (viewIndex > viewMax) DrawLv();
			if (viewIndex > viewMax * 2) DrawTime();
			if (viewIndex > viewMax * 3) DrawPoint();
			if (viewIndex > viewMax * 4) DrawButton();
			viewIndex += 1;
		}
		private var sizeTxt:int = G.Size8;
		private function DrawPoint():void
		{
			var str:String = "Point ";
			this.renderData.draw(TextHelper.TextToDraw(str + endPoint, sizeTxt)
			, new Matrix(1, 0, 0, 1
			, this.bitmapW / 2 - (str.length - 1) * sizeTxt
			, padding + 4 * G.Size16));
		}
		
		private function DrawTime():void
		{
			var str:String = "Time ";
			this.renderData.draw(TextHelper.TextToDraw(str + endTime, sizeTxt)
			, new Matrix(1, 0, 0, 1
			, this.bitmapW / 2 - (str.length - 1) * sizeTxt
			, padding + 3 * G.Size16));
		}
		
		private function DrawLv():void 
		{
			var str:String = "LV ";
			this.renderData.draw(TextHelper.TextToDraw(str + endLv, sizeTxt)
			, new Matrix(1, 0, 0, 1
			, this.bitmapW / 2 - (str.length - 1) * sizeTxt
			, padding + 2 * G.Size16));
		}
		
		private function DrawMenu():void
		{
			if (menu != null) this.renderData.draw(menu);
		}
		private function DrawGameOver():void {
			this.renderData.draw(TextHelper.TextToDraw("game over", G.Size16)
			, new Matrix(1, 0, 0, 1, padding, padding));
		}
		private function DrawButton():void
		{
			if (KInput.mouseDown == true) {
				this.renderData.draw(button1Up, button1Matrix);
			}else {
				this.renderData.draw(button1Down, button1Matrix);
			}
		}
		
		private function InitButton():void
		{
			var w:int = 3 * G.Size32;
			var h:int = G.Size32;
			var bx:int = (this.bitmapW - w) / 2;
			var by:int = this.bitmapH - (padding + G.Size32);
			button1Rect = new Rectangle(this.x + bx, this.y + by, w, h);
			button1Up = new BitmapData(w, h, true, 0);
			button1Down = new BitmapData(w, h, true, 0);
			var d1:BitmapData = KSources.getBitmap(1, 0, 9);
			var d2:BitmapData = KSources.getBitmap(1, 1, 9);
			var d3:BitmapData = KSources.getBitmap(1, 2, 9);
			//
			var d4:BitmapData = KSources.getBitmap(1, 3, 9);
			var d5:BitmapData = KSources.getBitmap(1, 4, 9);
			var d6:BitmapData = KSources.getBitmap(1, 5, 9);
			var matrix:Matrix = new Matrix();
			button1Up.draw(d1, matrix);
			button1Down.draw(d4, matrix);
			matrix.tx += G.Size32;
			button1Up.draw(d2, matrix);
			button1Down.draw(d5, matrix);
			matrix.tx += G.Size32;
			button1Up.draw(d3, matrix);
			button1Down.draw(d6, matrix);
			
			button1MatrixText = new Matrix(1, 0, 0, 1, 3 * G.Size8, 12);
			button1Up.draw(buttonText, button1MatrixText);
			button1Down.draw(buttonText, button1MatrixText);
			
			button1Matrix = new Matrix(1, 0, 0, 1
			, bx , by);
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void
		{
			super.draw(dc, alpha);
		}
		
		private function InitMenu():void
		{
			menu = this.renderData.clone();
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
							menu.draw(bmp5, matrix);
						}else if (j == countY - 1) {
							matrix.tx = i * bmp1.width;
							matrix.ty = j * bmp1.height;
							menu.draw(bmp6, matrix);
						}
						//
					}else if (j > 0 && j < countY - 1) {						
						if(i == 0){
							matrix.tx = 0;
							matrix.ty = j * bmp1.height;
							menu.draw(bmp7, matrix);
						}else if(i == countX - 1){
							matrix.tx = i * bmp1.width;
							matrix.ty = j * bmp1.height;
							menu.draw(bmp8, matrix);
						}
					}
					if (i > 0 && i < countX -1 && j > 0 && j < countY - 1) {
						matrix.tx = i * bmp1.width;
						matrix.ty = j * bmp1.height;
						menu.draw(bmp9, matrix);
					}
				}
			}
			
			matrix = new Matrix();			
			menu.draw(bmp1);
			matrix.tx = this.bitmapW - bmp1.width;
			menu.draw(bmp2, matrix);
			matrix.tx = 0;
			matrix.ty = this.bitmapH - bmp1.height;
			menu.draw(bmp3, matrix);
			matrix.tx = this.bitmapW - bmp1.width;
			matrix.ty = this.bitmapH - bmp1.height;
			menu.draw(bmp4, matrix);
		}
	}
}