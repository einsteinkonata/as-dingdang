package Konata.Arms 
{
	import KO.IHitTypes;
	import KO.K;
	import KO.KCircleEntity;
	import KO.KEmitter;
	import KO.KEntity;
	import KO.KHit;
	import KO.KRectangleEntity;
	import Konata.G;
	
	public class MagicA extends KCircleEntity implements IHitTypes
	{
		private var timeStart:int = 0;
		private var timeMax:int = 40;
		private var angle:Number = 0;
		
		public function MagicA()
		{
			super(0, 0, 10);
			
			this.x = Math.random() * (G.AndW - 60) + 30;
			this.y = Math.random() * (G.AndH - 180) + 20;
			this.angle = Math.random() * 360 * K.MPI180;
			speed = 3;
			
			draw(0xdd0000, .8);
		}
		
		override public function update():void
		{
			if (timeStart < timeMax) {
				if (timeStart == timeMax - 1) this.hitLayers.push(G.LayerPig);
				
				timeStart += 1;
			}
			else {
				vx = Math.cos(angle) * speed;
				vy = Math.sin(angle) * speed;
				
				if (this.x < G.OverX || this.x >= G.OverW
				|| this.y < G.OverY || this.y >= G.OverH) {
					K.game.remove(this);
				}
			}
		}
		
		override public function vsOBB(rect:KRectangleEntity):void {
			if (KHit.RectHitCircle(rect,this) == true) {
				K.game.remove(rect);
				K.game.remove(this);
			}
		}
		
		override public function vsCircle(circle:KCircleEntity):void {
			
		}
	}
}