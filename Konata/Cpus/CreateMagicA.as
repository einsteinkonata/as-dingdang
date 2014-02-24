package Konata.Cpus {
	import KO.K;
	import KO.KEntity;
	import Konata.Arms.MagicA;
	import Konata.G;
	import Konata.GConfig.CPlayer;

	public class CreateMagicA extends KEntity {
		private var index:int;
		private var prame:int;

		public function CreateMagicA(){
			super();
			visible = false;
			index = 0;
			prame = 25;
		}

		override public function update():void {
			index += 1 + prame;
			index %= prame;
			if (CPlayer.GetDeath() == true && index == 1){
				K.game.add(new MagicA(), G.LayerPow);
			}
		}
	}

}