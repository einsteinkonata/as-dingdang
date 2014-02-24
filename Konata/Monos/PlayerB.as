package Konata.Monos 
{
	import KO.K;
	import Konata.Arms.Pow2A;
	import Konata.Arms.Pow2B;
	import Konata.Arms.Pow2C;
	import Konata.Arms.Pow2D;
	import Konata.GConfig.CPlayer;
	/**
	 * ...
	 * @author ...
	 */
	public class PlayerB extends PlayerBase 
	{
		
		public function PlayerB() 
		{
			super();
			
			draw();
		}
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void {
			this.renderData = KSources.getBitmap(1);
		}
		
		// 散弹
		override public function OnPowA():void  {
			const powNum:Number = CPlayer.GetPowLevel();
			K.game.add(new Pow2A, G.LayerPow);
		}
		// 击中爆炸弹
		override public function OnPowB():void
		{
			const powNum:Number = CPlayer.GetPowLevel();
			K.game.add(new Pow2B, G.LayerPow);
		}
		// 横排
		override public function OnPowC():void
		{
			const powNum:Number = CPlayer.GetPowLevel();
			K.game.add(new Pow2C, G.LayerPow);
		}
		// 转转弹
		override public function OnPowD():void
		{
			const powNum:Number = CPlayer.GetPowLevel();
			K.game.add(new Pow2D, G.LayerPow);
		}
	}

}