package Konata.Monos 
{
	import KO.K;
	import KO.KRectangleEntity;
	import Konata.Arms.EffectA;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;
	import Konata.Items.Bell;
	
	public class PigBase extends KRectangleEntity 
	{
		public var point:int = 0;
		
		public function PigBase(x:Number, y:Number, width:Number, height:Number)
		{
			super(x, y, width, height);
		}
		
		public function OnDeath(IsKill:Boolean = true):void {
			K.game.add(new EffectA(this.CenterW, this.CenterH), "last");
			K.game.remove(this);
			
			if (IsKill == false) {
				CPlayer.SetHP( -1);
				return;
			}
			if (K.randomInt(17) <= 1) {
				K.game.add(new Bell( -1, -3, this.x, this.y));
			}
			CGame.point += point;
			
		}
	}
}