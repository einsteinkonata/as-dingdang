package Konata.Arms {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.IHitTypes;
	import KO.K;
	import KO.KCircleEntity;
	import KO.KEmitter;
	import KO.KEntity;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import Konata.G;
	import Konata.Monos.PigB;
	import Konata.Monos.PigBase;

	public class PowA extends PowBase {
		private var angle:Number;
		private var emitter:KEmitter;

		public function PowA(x:Number, y:Number, angle:Number){
			super(x, y, 5);
			this.hitLayers.push(G.LayerPig);

			this.angle = angle;
			speed = 9;

			draw(0x00ff00, 1);
			this.mx = -7;
			emitter = new KEmitter(this.renderData.clone(), this.diameter, this.diameter);
			emitter.newType("a", [0]);
			emitter.setAlpha("a", .6, 0);
		}

		var emi:int = 0;

		override public function update():void {
			vx = Math.cos(angle) * speed;
			vy = Math.sin(angle) * speed;
			//
			if (this.x < G.OverX || this.x >= G.OverW || this.y < G.OverY || this.y >= G.OverH){
				K.game.remove(this);
			}
			//
			//if (emi++ % 3 == 0){
				//var ang2:int = 70;
				//var ang:Number = (angle  * K.M180PI + 180 - ang2);//* -1
				//emitter.setMotion("a", ang, 20, .3, ang2 * 2, 0);
				//emitter.emit("a", this.x - this.radius, this.y - this.radius);
			//}
			//emitter.update();
		}
		//override public function render():void {
			//emitter.render();
			//K.game.RenderHelper(emitter);
		//}
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			this.renderData = KSources.getBitmap(2, 0, 9);
			
			//super.draw(dc, alpha);			
			//var m:Matrix = new Matrix(1, 0, 0, 1, 
			//-3, 
			//-3);
			//this.renderData.draw(KSources.getBitmap(2, 0, 9), m);
		}
	}
}