package Konata.Cpus 
{
	import Konata.G;
	import Konata.GConfig.CGame;
	/**
	 * ...
	 * @author 
	 */
	public class CreateLevelB extends CreateLevelA 
	{
		
		public function CreateLevelB() 
		{
			timeMax = 10;
			pigMax = G.PigMax;
			pigRate = G.PigRate;
			pigRobot = new PigRobotB(this);
			InitPigRobot();
		}
		
		override public function InitPigList():void
		{
			//到一时间段 一次
			if (pigList.length == 0) {				
				// 等级提升
				CGame.Level += 1;
				// 随机数量
				var count:int = pigMax + CGame.Level * pigRate;
				for (var i:int = 0; i < count; i++ ) {
					// 核心
					pigList.push(pigRobot.RandomCreate());
				}
				pigList.sortOn("spac", Array.NUMERIC);
				trace("开始 : ", CGame.Level.toString()
				,"time : ", CGame.timer);
			}
		}
		
		private function InitPigRobot() {
			pigList = [];
			var count:int = pigMax + CGame.Level * pigRate;
			for (var i:int = 0; i < count; i++ ) {
				// 核心
				pigList.push(pigRobot.RandomCreate());
			}
			pigList.sortOn("spac", Array.NUMERIC);
		}
	}
}