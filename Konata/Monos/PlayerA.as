package Konata.Monos {
	import KO.K;
	import KO.KInput;
	import KO.KRectangleEntity;
	import KO.KSources;
	import Konata.Arms.PowA;
	import Konata.Arms.PowB;
	import Konata.Arms.PowC;
	import Konata.Arms.PowD;
	import Konata.G;
	import Konata.GConfig.CPlayer;

	public class PlayerA extends PlayerBase {

		public function PlayerA() {
			super();
			
			draw();
		}
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void {
			this.renderData = KSources.getBitmap(1);
		}

		// 散弹
		override public function OnPowA():void  {
			const powNum:Number = CPlayer.GetPowLevel();
			const powAngle:int = 12;
			
			var angP:Number = powAngle * K.MPI180;
			var angP1:Number = (powNum > 1)
				? powNum / 2 * angP  - (4 * K.MPI180)
				: (2 * K.MPI180);// 修正(4 * K.MPI180): (2 * K.MPI180);
			var cx:Number = this.CenterW;
			var cy:Number = this.CenterH;
			var dx:Number = KInput.mouseX - cx;
			var dy:Number = KInput.mouseY - cy;
			var angM:Number = Math.atan2(dy, dx);
			for (var i:int = 0, count:int = powNum; i < count; i++) {
				var angle:Number = angM - angP1 + angP * i;
				K.game.add(new PowA(cx, cy, angle), G.LayerPow);
			}
		}
		// 击中爆炸弹
		override public function OnPowB():void
		{
				var numLV:int = CPlayer.GetPowLevel();
				K.game.add(new PowB(KInput.mouseX, KInput.mouseY, numLV));
		}
		// 横排
		override public function OnPowC():void
		{
			const powNum:Number = CPlayer.GetPowLevel();
			const powDis:Number = 18;
			
			var cx:Number, cy:Number,dx:Number,dy:Number;
			dx = KInput.mouseX - this.CenterW;
			dy = KInput.mouseY - this.CenterH;
			var angM:Number = Math.atan2(dy, dx);
			var angM2:Number = angM + 90 * K.MPI180;
			
			var dis:Number = (powNum - 1) * powDis / 2;
			for (var i:int = 0, count:int = powNum; i < count; i++) {
				var w2:Number = powDis * i - dis;
				cx = this.CenterW + Math.cos(angM2) * w2;
				cy = this.CenterH + Math.sin(angM2) * w2;
				
				K.game.add(new PowC(cx, cy, angM), G.LayerPow);
			}
		}
		// 转转弹
		override public function OnPowD():void
		{
			const powNum:Number = CPlayer.GetPowLevel();
			
			var cx:Number = this.CenterW;
			var cy:Number = this.CenterH;
			var dx:Number = KInput.mouseX - cx;
			var dy:Number = KInput.mouseY - cy;
			var angleM:Number = Math.atan2(dy, dx);
			for (var i:int = 0; i < powNum; i++) {
				var angleB:Number = (i / powNum * 360) * K.MPI180;
				
				var powD:PowD = new PowD(cx, cy, angleM);
				powD.x += Math.cos(angleB) * powD.speedB;
				powD.y += Math.sin(angleB) * powD.speedB;
				
				K.game.add(powD, G.LayerPow);
			}
		}
	}
}