package Konata.Cpus 
{
	import KO.K;
	import KO.KEntity;
	import Konata.G;
	import Konata.Monos.PigA;
	import Konata.Monos.PigB;
	import Konata.Monos.PigC;
	import Konata.Objs.ObjectPig;
	
	public class PigRobot {
		
		public static function RandomCreate():ObjectPig {
			var obj:ObjectPig = new ObjectPig();
			// 随机敌人
			obj.entity = RandomPig();
			// 随机时间
			obj.spac = Math.random() * G.TimeMax; // 30 分钟 毫秒
			
			return obj;
		}
		
		private static function RandomPig():KEntity {// 随机敌人
			var entity:KEntity = null;
			var index:int = K.randomInt(2);
			//return new PigA();		// test
			switch (index) {
				case 0:				//	entity = RandomPigA(); 默认
				break;
				case 1:
					entity = new PigB();
				break;
				case 2:
					entity = new PigC();
				break;
			}
			return (entity == null) ? new PigA() : entity;
		}
	}
}