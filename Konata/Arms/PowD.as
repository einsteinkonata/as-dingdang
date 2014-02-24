package Konata.Arms 
{
	import flash.geom.Point;
	import KO.IHitTypes;
	import KO.K;
	import KO.KAnimMap;
	import KO.KCircleEntity;
	import KO.KEmitter;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import Konata.G;
	
	public class PowD extends PowBase
	{
		private var angle:Number;
		private var angleBRate:Number = 0.3;
		private var ps:Point = new Point();
		
		public var speedB:int = 20;
		private var emitter:KEmitter;
		
		public function PowD(x:Number,y:Number, angle:Number)
		{
			super(x, y, 5);
			ps.x = x, ps.y = y;
			this.hitLayers.push(G.LayerPig);
			
			this.angle = angle;
			speed = 5;
			
			//draw();
			
			InitAnim();
		}
		
		private function InitAnim():void
		{
			_animMap = new KAnimMap();
			_animMap.add("move", [700, 710, 720, 730], 0.2);			
			_animMap.play("move");
		}
		
		override public function update():void
		{
			var dx:Number = this.x - ps.x;
			var dy:Number = this.y - ps.y;
			var angleB:Number = Math.atan2(dy, dx);
			angleB += angleBRate;
			
			ps.x += (Math.cos(angle)) * speed;
			ps.y += (Math.sin(angle)) * speed;
			
			this.x = ps.x + Math.cos(angleB) * speedB;
			this.y = ps.y + Math.sin(angleB) * speedB;
			
			if (this.x < G.OverX || this.x >= G.OverW
			|| this.y < G.OverY || this.y >= G.OverH) {
				K.game.remove(this);
			}
		}
		override public function render():void {
			_animMap.update();
			this.renderData = _animMap._source;
			this.my = this.mx = -this.renderData.width / 2;
		}
	}
}