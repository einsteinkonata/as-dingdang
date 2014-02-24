package Konata 
{
	
	public class G 
	{
		// 大小
		public static const Size:int = 40;
		// 固定比例
		public static const Size8:int = 8;
		public static const Size16:int = 16;
		public static const Size32:int = 32;
		// 宽高 游戏
		public static const AndW:int = 240;
		public static const AndH:int = 400;
		// 游戏容忍范围
		public static const OverX:int = -40;
		public static const OverY:int = -40;
		public static const OverW:int = 240 + 40;
		public static const OverH:int = 400 + 40;
		// 宽高 空白右边
		public static const MenuW:int = 200;
		public static const MenuH:int = 400;
		// 图层
		public static const LayerPig:String = "layerPig";
		public static const LayerItem:String = "layerItem";
		public static const LayerPow:String = "layerPow";
		public static const LayerPanel:String = "layerPanel";
		// 生成怪时间
		public static var TimeMax:int = 10;
		public static var PigMax:int = 3;
		public static var PigRate:int = 1;
		
		public static function Create():void {
		}
	}
}