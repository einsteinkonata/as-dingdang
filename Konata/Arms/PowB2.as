package Konata.Arms 
{
	import KO.IHitTypes;
	import KO.K;
	import KO.KCircleEntity;
	import KO.KEmitter;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import Konata.G;
	
	public class PowB2 extends PowBase
	{
		private var angle:Number;
		private var emitter:KEmitter;
		
		public function PowB2(x:Number,y:Number, angle:Number) 
		{
			super(x, y, 5);
			this.hitLayers.push(G.LayerPig);
			
			this.angle = angle;
			speed = 10;
			
			draw(0x00eecc, .5);
			
			emitter = new KEmitter(this.renderData, this.renderData.width, this.renderData.height);
			emitter.newType("a", [0]);
			emitter.setAlpha("a", .6, 0);
		}
		
		var emi:int = 0;
		override public function update():void
		{
			vx = Math.cos(angle) * speed;
			vy = Math.sin(angle) * speed;
			
			if (this.x < G.OverX || this.x >= G.OverW
			|| this.y < G.OverY || this.y >= G.OverH) {
				K.game.remove(this);
			}
			
			if (emi++ % 4 == 0) {
				emitter.setMotion("a", 0,  0, .4);
				emitter.emit("a", this.x + this.mx, this.y + this.my);
			}
			emitter.update();
		}
		override public function render():void
		{
			emitter.render();
			K.game.RenderHelper(emitter);
		}
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void
		{
			this.renderData = KSources.getBitmap(7, 4, 0);
			this.my = this.mx = -this.renderData.width / 2;
		}
	}
}