package Konata.Arms {
	import KO.IHitTypes;
	import KO.K;
	import KO.KCircleEntity;
	import KO.KEmitter;
	import KO.KHit;
	import KO.KInput;
	import KO.KRectangleEntity;
	import KO.KSources;
	import Konata.G;
	import Konata.GConfig.CPlayer;

	public class PowB extends KCircleEntity {
		private var emitter:KEmitter;
		private var powLevel:int;
		private var timeIndex:int = 0;
		private const timeMax:int = 30;

		public function PowB(x:Number, y:Number, powLevel:int) {
			this.powLevel = powLevel;
			super(x, y, 10);
			//
			draw(0x00eecc, 1);
			//
			emitter = new KEmitter(this.renderData, this.renderData.width, this.renderData.height);
			emitter.newType("a", [0]);
			emitter.setAlpha("a", 1, 0);
		}

		override public function update():void {
			if (this.x < G.OverX || this.x >= G.OverW || this.y < G.OverY || this.y >= G.OverH){
				K.game.remove(this);
			}
			OnMove();
			OnEmitter();
		}
		override public function render():void {
			emitter.render();
			K.game.RenderHelper(emitter);
		}
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			this.renderData = KSources.getBitmap(1, 0, 5);
			this.my = this.mx = -this.renderData.width / 2;
		}

		private function OnMove():void {
			timeIndex += 1;
			if (timeIndex > timeMax){
				const powNum:int = powLevel;
				//const powAngle:int = Math.floor(360 / 5);
				//
				//var angP:Number = powAngle * K.MPI180;
				//var angP1:Number = (powNum > 1) ? powNum / 2 * angP : 0;
				var cx:Number = this.CenterW;
				var cy:Number = this.CenterH;
				/*var dx:Number = KInput.mouseX - cx;
				var dy:Number = KInput.mouseY - cy;
				var angM:Number = Math.atan2(dy, dx);*/// no2
				for (var i:int = 0, count:int = powNum; i < count; i++){
					var angle:Number = ((i + 1) / powNum * 360 - 90) * K.MPI180; //angM - angP1 + angP * i;// no2
					K.game.add(new PowB2(cx, cy, angle), G.LayerPow);
				}
				K.game.remove(this);
			}
		}

		var emi:int = 0;

		private function OnEmitter():void {
			if (emi++ % 4 == 0){
				var valueAngle:Number = timeIndex / timeMax * 360 + 90;
				emitter.setMotion("a", valueAngle, 30, .4, 0, 0);
				emitter.emit("a", this.x + this.mx, this.y + this.my);
			}
			emitter.update();
		}

		
	}
}