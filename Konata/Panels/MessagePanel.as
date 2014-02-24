package Konata.Panels {
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import KO.K;
	import KO.KEntity;
	import KO.KSources;
	import Konata.G;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;
	import Konata.TextHelper;

	public class MessagePanel extends KEntity {
		private const paddingH:int = 40;
		private const paddingW:int = G.AndW;
		private const padding:int = 10;
		private var tformat:TextFormat;
		private var timeText:String;
		private var pointText:String;

		public function MessagePanel(){
			super(0, 0);
			this.bitmapW = paddingW;
			this.bitmapH = paddingH;

			tformat = new TextFormat(null, 26, 0xdd0000);
			//draw(0, 0);
			setTimeText();
		}

		override public function update():void {
			CGame.timer += K.elapsed;
			setTimeText();
		}
		
		private function setTimeText():void {
			timeText = Math.floor(CGame.timer).toString();
			timeText = timeText.length == 1 ? "00" + timeText : timeText.length == 2 ? "0" + timeText : timeText;
		}

		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void {
			super.draw(dc, alpha);

			DrawLevel();
			DrawPoint();
			DrawTime();			
			DrawHP();			
		}
		
		private function DrawLevel():void 
		{
			const size:int = 8;
			var lvText:String = "LV-" + CGame.Level.toString();
			var data:BitmapData = TextHelper.TextToDraw(lvText, size);
			var matrix:Matrix = new Matrix();
			matrix.tx = padding * 2;
			matrix.ty = padding;
			this.renderData.draw(data, matrix);
		}
		private function DrawPoint():void 
		{
			var size:int = 8;			
			var i:int = CGame.point.toString().length;
			
			pointText = "";
			for (; i < 6; i++) {
				pointText += "0";
			}
			pointText += CGame.point.toString();
			
			var data:BitmapData = TextHelper.TextToDraw(pointText, size);
			var matrix:Matrix = new Matrix();
			matrix.tx = padding * 2;
			matrix.ty = padding + size;
			this.renderData.draw(data, matrix);
			
			pointText = timeText.length == 1 ? "00" + timeText : timeText.length == 2 ? "0" + timeText : timeText;
		}

		private function DrawTime():void {
			var data:BitmapData = TextHelper.TextToDraw(timeText, 16);
			var matrix:Matrix = new Matrix();
			var maxW:int = 3 * data.height;
			matrix.tx = (3 - (data.width / data.height)) * data.height + G.AndW / 2 - maxW / 2;
			matrix.ty = padding;
			this.renderData.draw(data, matrix);
		}
		
		private function DrawHP():void {
			var count:uint = CPlayer.HP;
			for (var i:int = 0; i < count; i++){
				var matrix:Matrix = new Matrix();
				matrix.tx = G.AndW - (16 * (i + 1) + padding * 2);
				matrix.ty = padding + 1;
				this.renderData.draw(KSources.getBitmap(2, 9, 9), matrix);
			}
		}

		override public function render():void {
			draw(0, 0);
			//tf2.text = 	"Level : " + Lv.toString();
			//
			//this.renderData.draw(tf2, new Matrix(1, 0, 0, 1, tf2.x, tf2.y));
		}
	}
}