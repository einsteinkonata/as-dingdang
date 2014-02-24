package Konata.Cpus 
{
	import KO.K;
	import KO.KEntity;
	import Konata.G;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;
	import Konata.Objs.ObjectPig;
	
	/**
	 * ...
	 * @author 
	 */
	public class CreateLevelBase extends KEntity 
	{
		public var pigList:Array = [];
		//
		public var timeMax:int;
		public var pigMax:int;
		public var pigRate:int;
		
		public var pigRobot:PigRobotBase;
		
		public function CreateLevelBase() 
		{
			pigList = [];
			timeMax = G.TimeMax;
			pigMax = G.PigMax;
			pigRate = G.PigRate;
		}
		
		override public function update():void 
		{
			InitPigList();
			runPigList();
		}
		
		public function InitPigList():void
		{
			return;
		}
		
		public function runPigList():void
		{// 增加该出场 敌人
			if (pigList.length == 0 || CPlayer.HP == 0) return;
			if (CGame.timer >= pigList[0].spac) {
				K.game.add(pigList.shift().entity, G.LayerPig);
			}
		}
		
		override public function removed():void
		{
			pigRobot = null;
		}
	}
}