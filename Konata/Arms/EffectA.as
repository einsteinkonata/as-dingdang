package Konata.Arms {
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;

	public class EffectA extends KEntity {

		public function EffectA(x:Number, y:Number) {
			super(x - 8, y - 8);

			this._animMap = new KAnimMap();
			_animMap.add("pow", [103, 113, 123, 133, 143], 0.08, false);
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