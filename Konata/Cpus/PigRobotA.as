package Konata.Cpus 
{
	import KO.K;
	import KO.KEntity;
	import Konata.G;
	import Konata.GConfig.CGame;
	import Konata.Monos.PigA;
	import Konata.Monos.PigB;
	import Konata.Monos.PigC;
	import Konata.Objs.ObjectPig;
	
	public class PigRobotA extends PigRobotBase {
		
		public function PigRobotA(cl:CreateLevelBase) {
			CL = cl;
		}
		
		override public function RandomCreate():ObjectPig {
			var obj:ObjectPig = new ObjectPig();
			// 随机敌人
			obj.entity = RandomPig();
			// 随机时间
			obj.spac = Math.random() * CL.timeMax;// 30 分钟 毫秒
			obj.spac += ((CGame.Level - 1) * CL.timeMax); // 加最大时间
			return obj;
		}
		
		private function RandomPig():KEntity {// 随机敌人
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