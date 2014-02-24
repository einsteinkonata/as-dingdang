package Konata.Panels
{
	import KO.K;
	import KO.KEntity;
	import Konata.G;
	
	public class MenuMain extends KEntity
	{
		public function MenuMain()
		{
			super(0, 0);
			this.x = G.AndW;
			this.y = 0;
			this.bitmapW = K.W - G.AndW;
			this.bitmapH = K.H;
			
			draw(0x000000, 1);
		}
	}
}