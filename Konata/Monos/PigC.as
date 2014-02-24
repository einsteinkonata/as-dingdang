package Konata.Monos
{
	import flash.geom.Matrix;
	import flash.geom.Point;
	import KO.K;
	import KO.KAnimMap;
	import KO.KRectangleEntity;
	import Konata.Arms.EffectA;
	import Konata.G;
	import Konata.GConfig.CPlayer;
	import Konata.Items.Bell;
	
	public class PigC extends PigBase
	{
		private var endPoint:Point;
		private var maxx:int = G.AndW;
		private var maxy:int = 300;
		private var stopIndex:int = 0;
		
		public function PigC()
		{
			super(0, 0, 16, 16);
			
			this.x = Math.random() * (G.AndW - this.width);
			this.y = -this.height;
			this.mx = -8;
			this.my = -8;
			
			this.speed = 1.5;
			
			this.point = 150;
			
			endPoint = new Point();
			initEndPoint();
			
			draw(0x0000aa,.8);
			InitAnim();
		}
		
		private function InitAnim():void 
		{
			_animMap = new KAnimMap();
			_animMap.add("move", [104, 114, 124, 134], 0.2);
			_animMap.play("move");
		}
		
		override public function update():void
		{
			var dx:Number = endPoint.x - this.x;
			var dy:Number = endPoint.y - this.y;
			if (Math.abs(dx) > 2
			&& 	Math.abs(dy) > 2) {
				var ang:Number = Math.atan2(dy, dx);
				vx = Math.cos(ang) * speed;
				vy = Math.sin(ang) * speed;
			}
			else {
				initEndPoint();
			}
		}
		override public function render():void {
			_animMap.update();
			this.renderData = _animMap._source;
			
			//draw(0xaa0000, 0.7);
			//var matrix:Matrix = new Matrix();
			//matrix.tx = -8;
			//matrix.ty = -8;
			//this.renderData.draw(_animMap._source,matrix);
		}
		
		private function initEndPoint():void {
			endPoint.x = Math.random() * (maxx - 30);
			endPoint.y = Math.random() * maxy;
		}
	}
}











