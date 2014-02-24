package Konata.Items {
	import KO.IHitTypes;
	import KO.K;
	import KO.KAnimMap;
	import KO.KCircleEntity;
	import KO.KHit;
	import KO.KRectangleEntity;
	import Konata.Arms.EffectA;
	import Konata.Arms.EffectB;
	import Konata.Arms.PowB;
	import Konata.G;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;

	public class Bell extends KCircleEntity implements IHitTypes {
		private var offset:Number = 0.5;
		private var speedX:Number = 0;

		private const gravity:Number = 0.06;
		private const offsetMaxX:int = 60;
		private const speedMaxY:Number = 4;

		private var status:int = -1;
		private var chance:int = 0; // 可攻击次数

		private const chanceMin:int = 13;
		private const chanceMax:int = 20;

		public function Bell(status:int = -1, speed:Number = 0, x:int = 0, y:int = 0){
			super(0, 0, 10);

			this.hitLayers.push(G.LayerPow);

			this.x = (x == 0) ? Math.random() * (G.AndW - this.radius) : x;
			this.y = (y == 0) ? -this.diameter : y;
			this.my = this.mx = -16 / 2;

			this.speed = speed;

			SetOffset();
			
			this.status = status;
			Init();
			InitAnim();
			AnimPlay();
		}

		private function Init(){
			chance = chanceMin + chanceMax * Math.random();
		}

		private function InitAnim():void {
			_animMap = new KAnimMap();
			for (var i:int = 0; i < 9; i++){
				var name:String = "00" + i.toString();
				var v1:int = 000 + i;
				var v2:int = 010 + i;
				var v3:int = 020 + i;
				var v4:int = 030 + i;
				var v5:int = 040 + i;
				_animMap.add(name, [v1, v2, v3, v2, v1, v4, v5, v4], 0.4);
			}
		}

		private function AnimPlay():void {
			if (status > -1 && status < 8){
				var name:String = "00" + (status + 1).toString();
				_animMap.play(name);
				return;
			} else {
				_animMap.play("006"); //defaultName
			}
		}

		private function RandomStatus(){
			if (K.randomInt(3) > 0){
				status = -1;
				return;
			}

			if (K.randomInt(17) < 14){
				status = K.randomInt(3);
				return;
			} else {
				status = K.randomInt(3) + 4;
				return;
			}
		}

		override public function update():void {
			speed += gravity;
			vy = (speed > speedMaxY) ? speedMaxY : speed;
			vx = speedX;

			if (this.x < G.OverX || this.x >= G.OverW || this.y >= G.AndH - 80){
				SetPowValue();
				K.game.remove(this);
			}
		}

		private function SetPowValue() {
			if (status < 0) {
				CGame.point += 200;
			} else if (status >= 0 && status <= 3){
				CPlayer.SetPow(status);
			} else if (status == 4){
				CPlayer.SetHP(1);
			} else if (status == 5){
				CPlayer.SetHP(1);
			}
		}

		override public function render():void {
			_animMap.update();
			this.renderData = _animMap._source;
		}

		private function SetOffset():void {
			if (this.x < offsetMaxX){
				speedX = offset;
			} else if (this.x > G.AndW - offsetMaxX){
				speedX = offset * -1;
			} else {
				speedX = (Math.round(Math.random()) == 1) ? offset * -1 : offset;
			}
		}

		override public function vsOBB(rect:KRectangleEntity):void {
		}

		override public function vsCircle(circle:KCircleEntity):void {
			if (KHit.CircleHitCircle(circle, this) == true){
				K.game.add(new EffectB(this.CenterW, this.CenterH + 8), "last");
				this.speed = -3;
				SetOffset();
				RandomStatus();
				AnimPlay();
				chance -= 1;
				if (chance <= 0)
					K.game.remove(this);
				K.game.remove(circle);
			}
		}
	}
}