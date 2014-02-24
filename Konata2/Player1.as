package Konata2 {
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Point;
	import KO.K;
	import KO.KCircleEntity;
	import KO.KEmitter;
	import KO.KHit;
	import KO.KInput;
	import KO.KParticle;

	public class Player1 extends KCircleEntity {
		public var ps:Array = [];

		private var emitter:KEmitter;

		public function Player1(){
			super(200, 200, 32);
			speed = 3;
			var layer1:String = Game.T.layer1;
			if (K.game.CheckLayerName(layer1) != "") {
				this.hitLayers.push(layer1);
			}
			draw(0x00ffff, .3);
			emitter = new KEmitter(this.renderData.clone(), this.diameter, this.diameter);
			emitter.newType("a", [0]);
			emitter.setAlpha("a");
			emitter.setMotion("a", 0, 100, 1.1, 100, 100);
		}

		override public function update():void {
			if (KInput.mouseDown){
				move();
				particleUpdate();
			}
			emitter.update();
		}

		private function particleUpdate():void {
			emitter.emit("a", this.x + this.mx, this.y + this.my);
		}

		override public function render():void {
			emitter.render();
			K.game.RenderHelper(emitter);
		}

		private function move():void {
			if (KHit.CircleHitPoint(this, new Point(KInput.mouseX, KInput.mouseY))){
				return;
			}
			var dx:Number = KInput.mouseX - this.x;
			var dy:Number = KInput.mouseY - this.y;
			var ar:Number = Math.atan2(dy, dx);
			vx = Math.cos(ar) * speed;
			vy = Math.sin(ar) * speed;

			//var i:int, count:int = Game.T.ps.length;
			//var p2:Player2;
			//for (i = 0; i < count; i++ ) {
			//p2 = Game.T.ps[i];
			//p2.vx += vx * .08;
			//p2.vy += vy * .08;
			//}
		}

		public function add():void {

		}
	}
}