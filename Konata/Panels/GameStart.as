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
	import Konata.TextHelper;
	
	public class GameStart extends KEntity
	{		
		private var bg:BitmapData;
		private var button1Down:BitmapData;
		private var button1Up:BitmapData;
		private var button1Matrix:Matrix;
		private var button1Rect:Rectangle;
		private var button1Text:BitmapData;
		
		public function GameStart()
		{
			this.bitmapW = G.AndW;
			this.bitmapH = G.AndH;
			InitDraw();
			draw();
		}
		
		override public function update():void
		{
			draw();
			if (KInput.mouseUp == true
			&& KHit.RectHitXY(button1Rect, KInput.mouseX, KInput.mouseY) == true) {
				KInput.mouseUp = false;
				Game.T.Start();
			}
		}
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void
		{
			super.draw(0, 0);
			this.renderData.draw(bg);
			DrawButton();
		}
		private function DrawButton():void
		{
			if (KInput.mouseDown == true) {
				this.renderData.draw(button1Down, button1Matrix);
			}else {
				this.renderData.draw(button1Up, button1Matrix);
			}
		}
		
		private function InitDraw():void
		{
			bg = KSources.getBitmap(8).clone();
			button1Text = TextHelper.TextToDraw("play", G.Size8);
			InitButton();
		}
		private function InitButton():void
		{
			var matrix:Matrix = new Matrix();
			var w:int = 3 * G.Size32;
			var h:int = G.Size32;
			var bx:int = (this.bitmapW - w) / 2;
			var by:int = this.bitmapH - (4 * G.Size32);
			button1Matrix = new Matrix(1, 0, 0, 1, bx , by);
			button1Rect = new Rectangle(this.x + bx, this.y + by, w, h);
			
			button1Up = new BitmapData(w, h, true, 0);
			button1Down = button1Up.clone();
			
			var d1:BitmapData = KSources.getBitmap(1, 0, 9);// 1
			var d2:BitmapData = KSources.getBitmap(1, 1, 9);// 2
			var d3:BitmapData = KSources.getBitmap(1, 2, 9);// 3
			//
			var d4:BitmapData = KSources.getBitmap(1, 3, 9);// 1
			var d5:BitmapData = KSources.getBitmap(1, 4, 9);// 2
			var d6:BitmapData = KSources.getBitmap(1, 5, 9);// 3
			
			button1Down.draw(d1, matrix);
			button1Up.draw(d4, matrix);
			matrix.tx += G.Size32;
			button1Down.draw(d2, matrix);
			button1Up.draw(d5, matrix);
			matrix.tx += G.Size32;
			button1Down.draw(d3, matrix);
			button1Up.draw(d6, matrix);
			
			matrix = new Matrix(1, 0, 0, 1, 4 * G.Size8, 12);
			button1Down.draw(button1Text, matrix);
			button1Up.draw(button1Text, matrix);
		}
	}
}
















