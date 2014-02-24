package Konata
{
	import KO.K;
	import Konata.Backgrounds.SceneA;
	import Konata.Cpus.CreateLevelA;
	import Konata.Cpus.CreateLevelB;
	import Konata.GConfig.CGame;
	import Konata.GConfig.CPlayer;
	import Konata.Items.Bell;
	import Konata.Monos.PigA;
	import Konata.Monos.PlayerA;
	import Konata.Panels.ArmMenu;
	import Konata.Panels.EmitterPanel;
	import Konata.Panels.GameStart;
	import Konata.Panels.MenuDialog;
	import Konata.Panels.MenuDialogB;
	import Konata.Panels.MenuMain;
	import Konata.Panels.MessagePanel;
	import Konata.Panels.WallPanel;
	
	public class Game
	{
		public static var T:Game;
		
		private var createLevel:CreateLevelA;
		
		public function Game() {
			TextHelper.CreateTextDic();
		}
		
		public function InitLayer():void
		{
			//K.game.addLayer(G.LayerPig);
			//K.game.addLayer(G.LayerItem);
			//K.game.addLayer(G.LayerPow);
			//K.game.addLayer(G.LayerPanel);
			
		}
		
		public function Op():void {
			K.game.removeAll();
			K.game.add(new GameStart());
		}
		
		public function Start():void {
			K.game.removeAll();
			
			CGame.Create();
			CPlayer.Create();
			
			//createLevel = new CreateLevelA();
			createLevel = new CreateLevelB();
			
			InitMain();
			InitCpu();
			InitGame();
			
			CPlayer.InitPlayer();
		}
		
		
		private function InitMain():void
		{
			K.game.add(new SceneA(), "first");
			K.game.add(new MenuMain(),G.LayerPanel);
			K.game.add(new ArmMenu(),G.LayerPanel);
			//K.game.add(new WallPanel(), G.LayerPanel);
			K.game.add(new MessagePanel(), G.LayerPanel);
			//K.game.add(new EmitterPanel(), "last");
		}
		
		private function InitCpu():void
		{
			K.game.add(createLevel);
		}
		
		private function InitGame():void
		{
			K.game.add(new Bell(4));
		}
	}
}















