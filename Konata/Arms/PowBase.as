package Konata.Arms 
{
	import KO.IHitTypes;
	import KO.K;
	import KO.KCircleEntity;
	import KO.KHit;
	import KO.KRectangleEntity;
	import Konata.Monos.PigBase;
	
	public class PowBase extends KCircleEntity implements IHitTypes
	{
		public function PowBase(x:Number, y:Number, radius:Number) {
			super(x, y, radius);
		}
		
		override public function vsOBB(rect:KRectangleEntity):void {
			if (KHit.RectHitCircle(rect, this) == true) {
				if (rect is PigBase) {
					(rect as PigBase).OnDeath();
				}
				K.game.remove(this);
			}
		}

		override public function vsCircle(circle:KCircleEntity):void {

		}
	}
}