package Konata.Monos {
	import flash.geom.Matrix;
	import KO.K;
	import KO.KAnimMap;
	import KO.KRectangleEntity;
	import Konata.Arms.EffectA;
	import Konata.G;
	import Konata.GConfig.CPlayer;
	import Konata.Items.Bell;

	public class PigA extends PigBase {
		private var sx:Number = 0;
		private var actIndex:int = 0;
		private var actInit:int = 90;
		private var actRandom:int = 90;

		public function PigA(){
			super(0, 0, 18, 20);
			//
			this.x = Math.random() < 0.5 ? 0 - this.width : G.AndW;
			this.y = Math.random() * 60 + 40;
			this.mx -= 7;
			this.my -= 10;
			//
			speed = 1;
			point = 100;
			actInit += K.randomInt(getRandom() * 2);
			//
			sx = this.x < 0 ? speed : speed * -1;
			//
			InitAnim();
		}
		
		private function InitAnim():void
		{
			_animMap = new KAnimMap();
			_animMap.add("move", [102, 112, 122, 132, 142, 152], 0.09);
			_animMap.play("move");
		}

		override public function update():void {
			if (this.x < 0)
			{
				sx *= -1;
				this.x = 0 + 1;
			}else
			if(this.x + this.width > G.AndW) {
				sx *= -1;
				this.x = G.AndW - this.width - 1;
			}
			OnAct();
			
			vx = sx;
		}
		
		private function OnAct():void 
		{
			actIndex += 1 + actInit;
			actIndex %= actInit;
			if (actIndex == 0) {
				var pig:PigB = new PigB();
				pig.x = this.x;
				pig.y = this.y;
				pig.speed -= 0.4;
				K.game.add(pig, G.LayerPig);
				actInit += K.randomInt(getRandom());
			}
		}
		override public function render():void {
			_animMap.update();
			this.renderData = _animMap._source;
			
			//draw(0xaa0000, 0.7);
			//var matrix:Matrix = new Matrix();
			//matrix.tx = -7;
			//matrix.ty = -10;
			//this.renderData.draw(_animMap._source,matrix);
		}
		
		private function getRandom():int {
			return actRandom;
		}
	}
}