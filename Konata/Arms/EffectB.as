package Konata.Arms 
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	
	public class EffectB extends KEntity 
	{
		
		public function EffectB(x:Number, y:Number) {
			super(x - 16, y - 16);

			this._animMap = new KAnimMap();
			_animMap.add("pow", [105, 115, 125, 135], 0.08, false);
			_animMap.play("pow");
		}

		override public function update():void {
			if (_animMap.IsOver == true) {
				K.game.remove(this);
			}
		}

		override public function render():void {
			_animMap.update();
			this.renderData = _animMap._source;
		}
	}

}