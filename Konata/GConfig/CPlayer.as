package Konata.GConfig {
	import KO.K;
	import KO.KEntity;
	import Konata.Arms.MagicArun;
	import Konata.G;
	import Konata.Monos.PlayerA;
	import Konata.Monos.PlayerBase;
	import Konata.Panels.GameOver;

	public class CPlayer {
		private static var _hp:int = 0;
		private static const hpMax:int = 3;

		private static var LVPowA:int = 0;
		private static var LVPowB:int = 0;
		private static var LVPowC:int = 0;
		private static var LVPowD:int = 0;

		public static var player:PlayerBase;
		public static const energyVol:int = 60;
		public static const energyMax:int = 150;

		public static var SelectType:int = 0;
		public static const SelectTypeMax:int = 4;
		public static var IsDrawArm:Boolean;
		public static var IsGameOver:Boolean;
		public static var powEnergy:Array = [];

		private static const max:int = 5;
		
		public static function Create():void {
			_hp = hpMax;
			_hp = 1;
			LVPowA = LVPowB = LVPowC = LVPowD = 5;
			//LVPowA = 1;
			IsDrawArm = true;
			IsGameOver = false;
			//
			powEnergy = [];
			for (var i:int = 0; i < SelectTypeMax; i++){
				var value:int = energyMax;
				powEnergy.push(value);
			}
		}
		
		public static function InitPlayer(p:PlayerBase = null) {
			player = (p == null) ? new PlayerA() : p;
			K.game.add(player, G.LayerPanel);
		}

		public static function SetPow(type:int):void {
			IsDrawArm = true; // 该画图
			switch (type){
				case 0:
					LVPowA += 1;
					LVPowA = (LVPowA > max) ? max : LVPowA;
					break;
				case 1:
					LVPowB += 1;
					LVPowB = (LVPowB > max) ? max : LVPowB;
					break;
				case 2:
					LVPowC += 1;
					LVPowC = (LVPowC > max) ? max : LVPowC;
					break;
				case 3:
					LVPowD += 1;
					LVPowD = (LVPowD > max) ? max : LVPowD;
					break;
			}
		}

		public static function GetPowLevel(value:int = -1):int {
			value = (value == -1) ? SelectType : value;
			switch (value){
				case 0:
					return LVPowA;
				case 1:
					return LVPowB;
				case 2:
					return LVPowC;
				case 3:
					return LVPowD;
			}
			return LVPowA;
		}

		public static function IsDelEnergy():Boolean {
			var ve:int = powEnergy[SelectType] - player.energy[SelectType];
			if (ve >= 0){
				powEnergy[SelectType] = ve;
				return true;
			} else {
				return false;
			}
		}

		static public function get HP():int {
			return _hp;
		}

		static public function SetHP(value:int):void {
			if (_hp + value <= hpMax) {
				//return;
				_hp += value;
				_hp = (_hp < 0) ? 0 : _hp;
				if (_hp == 0 && IsGameOver == false) {
					K.game.add(new GameOver());
					IsGameOver = true;
				}
			}
		}
	}
}