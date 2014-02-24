package Konata.Cpus 
{
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import KO.K;
	import KO.KEntity;
	import Konata.G;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;
	import Konata.Objs.ObjectPig;
	
	public class CreateLevelA extends CreateLevelBase
	{		
		public function CreateLevelA()
		{
			super();
			pigRobot = new PigRobotA(this);
		}
		
		override public function InitPigList():void
		{
			//  随机生成初始怪	// 总时间
			var timer:int = Math.floor(CGame.timer);
			//到一时间段 一次
			if (timer % timeMax == 0 && pigList.length == 0) {
				// 等级提升
				CGame.Level = Math.floor(timer / timeMax) + 1;
				// 随机数量
				var count:int = pigMax + CGame.Level * pigRate;
				for (var i:int = 0; i < count; i++ ) {
					// 核心
					pigList.push(pigRobot.RandomCreate());
				}
				pigList.sortOn("spac", Array.NUMERIC);
				
				trace("开始 : ", CGame.Level.toString());
			}
		}
	}
}