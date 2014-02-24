package Konata.Panels {
	import adobe.utils.CustomActions;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import KO.K;
	import KO.KEntity;
	import KO.KHit;
	import KO.KInput;
	import KO.KSources;
	import Konata.G;
	import Konata.GConfig.CPlayer;
	import Konata.TextHelper;

	public class ArmMenu extends KEntity {
		private var tformat:TextFormat;
		private const paddingH:int = 40;
		private const paddingW:int = 40;
		private const padding:int = 10;

		private var rectList:Array;

		public function ArmMenu() {
			super(0, 0);
			this.x = 0;
			this.y = G.AndH - (paddingW + padding * 2);
			this.bitmapW = G.AndW;
			this.bitmapH = G.AndH;
			//
			rectList = [];
			//
			tformat = new TextFormat(null, 30);
		}

		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void {
			super.draw(dc, alpha);
			for (var i:int = 0, count:int = 4; i < count; i++) {
				var matrix:Matrix = new Matrix();
				matrix.tx = 25 + (10 + paddingW) * i;
				matrix.ty = padding;
				// 画图用
				var bmpData:BitmapData = new BitmapData(48, 48, true, 0);
				var color:uint = (CPlayer.SelectType == i) ? 0xcc0000 : 0x555555;
				bmpData = getBitmapData(bmpData, color, i);
				this.renderData.draw(bmpData, matrix);
				// 选择用
				rectList.push(new Rectangle(this.x + matrix.tx, this.y + matrix.ty, paddingW, paddingH));
			}
		}

		private function getBitmapData(data:BitmapData, color:uint, i:int):BitmapData {
			//var shape:Shape = new Shape();
			//shape.graphics.beginFill(color);
			//shape.graphics.drawRect(0, 0, paddingW, paddingH);
			//shape.graphics.endFill();
			var m:Matrix = new Matrix();
			
			var energy:Shape = new Shape();
			var ew:Number = (CPlayer.powEnergy[i] / CPlayer.energyMax) * 28;
			energy.graphics.beginFill(0x5294ef);
			energy.graphics.drawRect(10, 2, ew, 4);
			energy.graphics.endFill();
			
			var txt:BitmapData = TextHelper.TextToDraw(CPlayer.GetPowLevel(i).toString());

			//data.draw(shape);
			data.draw(txt);
			data.draw(energy);
			m.tx = 8 * 1;
			data.draw(KSources.getBitmap(7, 0, 8), m);
			m.tx = 8 * 2;
			data.draw(KSources.getBitmap(7, 1, 8), m);
			m.tx = 8 * 3;
			data.draw(KSources.getBitmap(7, 1, 8), m);
			m.tx = 8 * 4;
			data.draw(KSources.getBitmap(7, 2, 8), m);
			
			var bmp:BitmapData = (CPlayer.SelectType != i)
				? getSelect(5, 5, 6, 5)
				: getSelect(5, 5, 3, 5);
			m.tx = 0;
			m.ty = 8;
			data.draw(bmp, m);
			m.tx = 12;
			m.ty = 20;
			//m.scale(1.5, 1.5);
			data.draw(KSources.getBitmap(0, 0, i + 1), m);
			return data;
		}

		override public function update():void {
			if (KInput.mouseUp == true) {
				for (var i:int = 0, count = 4; i < count; i++) {
					var rect:Rectangle = rectList[i] as Rectangle;
					if (KHit.RectHitXY(rect, KInput.mouseX, KInput.mouseY)) {
						CPlayer.SelectType = i;
						CPlayer.IsDrawArm = true;
						break;
					}
				}
			}
			EnergyUpdate();
		}
		private function EnergyUpdate() {
			var value:Number;
			var index:int = CPlayer.powEnergy.length;
			while (index--) {
				value = CPlayer.powEnergy[index];
				CPlayer.powEnergy[index] = (value < CPlayer.energyMax) ? value + 1 : value;
			}
		}

		override public function render():void {
			draw(0x0000cc, 0);
		}
		
		private function getSelect(countX:int,countY:int,bx:int = 0,by:int = 0):BitmapData{
			var menu:BitmapData = new BitmapData(8 * countX, 8 * countY, true, 0);
			
			var b0:int = 0 + bx, b1 = 1 + bx, b2 = 2 + bx,
				c0 = 0 + by,c1 = 1 + by,c2 = 2 + by;
			
			
			var bmp1:BitmapData = KSources.getBitmap(4, b0, c0);//7
			var bmp2:BitmapData = KSources.getBitmap(4, b2, c0);//9
			var bmp3:BitmapData = KSources.getBitmap(4, b0, c2);//1
			var bmp4:BitmapData = KSources.getBitmap(4, b2, c2);//3
			var bmp5:BitmapData = KSources.getBitmap(4, b1, c0);//8
			var bmp6:BitmapData = KSources.getBitmap(4, b1, c2);//2
			var bmp7:BitmapData = KSources.getBitmap(4, b0, c1);//4
			var bmp8:BitmapData = KSources.getBitmap(4, b2, c1);//6
			var bmp9:BitmapData = KSources.getBitmap(4, b1, c1);//5
			
			var matrix:Matrix = new Matrix();
			var i:int, j:int;
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
			matrix.tx = menu.width - bmp1.width;
			menu.draw(bmp2, matrix);
			matrix.tx = 0;
			matrix.ty = menu.height - bmp1.height;
			menu.draw(bmp3, matrix);
			matrix.tx = menu.width - bmp1.width;
			matrix.ty = menu.height - bmp1.height;
			menu.draw(bmp4, matrix);
			return menu;
		}
	}
}