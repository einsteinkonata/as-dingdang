package Konata.Monos 
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KRectangleEntity;
	import Konata.Arms.EffectA;
	import Konata.G;
	import Konata.GConfig.CPlayer;
	import Konata.Items.Bell;
	
	public class PigB extends PigBase 
	{
		private var sy:Number = 0;
		
		public function PigB() 
		{
			super(0, 0, 16, 16);
			
			this.x = Math.random() * (G.AndW - this.width);
			this.y = -this.height;
			//
			speed = 1;
			point = 50;
			//
			sy = this.y < 0 ? speed : speed * -1;
			
			InitAnim();
		}
		
		private function InitAnim():void 
		{
			_animMap = new KAnimMap();
			_animMap.add("move", [200, 210, 220, 230, 240, 250, 260, 270], 0.1);
			_animMap.play("move");
		}
		
		override public function update():void 
		{
			vy = sy;
			
			if (this.x < G.OverX || this.x >= G.OverW 
			|| this.y >= G.AndH - 80) {
				this.OnDeath(false);
				K.game.remove(this);
			}
		}
		override public function render():void {
			_animMap.update();
			this.renderData= (_animMap._source);
		}
	}

}