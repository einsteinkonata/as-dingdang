package Konata.Panels 
{
	import KO.KEntity;
	import Konata.G;
	
	public class WallPanel extends KEntity 
	{
		private const paddingH:int = 30;
		private const paddingW:int = 30;
		private const padding:int = 10;
		
		public function WallPanel() 
		{
			super(0, 0);
			this.x = 0;
			this.y = G.AndH - (60 + paddingH);
			this.bitmapW = G.AndW;
			this.bitmapH = paddingH;
			
			draw(0x2b2b2b, 0);
		}
	}
}