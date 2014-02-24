package Konata2 
{
	import KO.K;
	
	public class Game 
	{
		private const num:int = 20;
		
		public static var T:Game;
		
		public var ps:Array;
		public var ms:Array;
		
		public var p1:Player1;
		//public var ball1:Ball1;
		//public var rect1:Rect1;
		public var layer1:String = "rect";
		
		public function Game() {
			T = this;
			
			K.game.addLayer(layer1);
		}
		
		public function start():void {
			p1 = new Player1();
			
			var rect1:Rect1 = new Rect1();
			rect1.x = 30;
			rect1.y = 30;
			
			var ball1:Ball1 = new Ball1();
			ball1.x = 350;
			ball1.y = 250;
			
			var ball2:Ball1 = new Ball1();
			ball2.x = 250;
			ball2.y = 350;
			
			K.game.add(p1);
			K.game.add(rect1, layer1);
			K.game.add(ball1, layer1);
			K.game.add(ball2, layer1);
		}
	}
}