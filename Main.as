package
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import KO.KEngine;
	import KO.KSources;
	import Konata.Game;
	
	public class Main extends KEngine
	{
		public function Main()
		{
			super(480, 400, 30, 0);
			
			FileLoad();
		}
		
		private function FileLoad():void 
		{
			var s:KSources = new KSources();
			
			s.addImages(
			["001mono16.png", new Rectangle(0, 0, 16, 16)]
			,["002mono32.png", new Rectangle(0, 0, 32, 32)]
			,["003mono16.png", new Rectangle(0, 0, 16, 16)]
			,["004map.png", new Rectangle(0, 0, 240, 400)]
			,["005text8.png", new Rectangle(0, 0, 8, 8)]
			,["006text16.png", new Rectangle(0, 0, 16, 16)]
			,["007text32.png", new Rectangle(0, 0, 32, 32)]
			,["008mono8.png", new Rectangle(0, 0, 8, 8)]
			,["009map.png", new Rectangle(0, 0, 240, 400)]);
			
			//s.addSoundsClass();
			
			s.addEventListener(KSources.Loaded, GameInit);
			s.Load();
		}
		private function GameInit(e:Event):void 
		{
			Game.T = new Game();
			Game.T.Op();
		}
	}
}