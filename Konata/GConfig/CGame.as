package Konata.GConfig 
{
	/**
	 * ...
	 * @author ...
	 */
	public class CGame extends Object 
	{
		// 游戏 参数
		public static var timer:Number;		
		public static var Level:int;
		public static var point:int;
		
		public static function Create():void {
			timer = 0;
			point = 0;
			Level = 1;
		}
	}

}