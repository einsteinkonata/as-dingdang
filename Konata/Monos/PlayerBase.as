package Konata.Monos 
{
	import KO.K;
	import KO.KEntity;
	import KO.KInput;
	import Konata.G;
	import Konata.GConfig.CPlayer;
	
	public class PlayerBase extends KEntity 
	{
		public var energy:Array;
		
		public function PlayerBase() 
		{
			this.bitmapH = this.bitmapW = 32;
			this.x = (G.AndW - this.bitmapW) / 2;
			this.y = G.AndH - this.bitmapH - 80;
			
			energy = [60, 60, 60, 60];
		}
		
		override public function update():void {
			if (KInput.mouseUp == true && KInput.mouseY < this.CenterH) {
				if(CPlayer.GetPowLevel() > 0 && (CPlayer.IsDelEnergy() == true)) {
					OnSelectPow();
				}
			}
		}
		
		public function OnSelectPow() {
			switch(CPlayer.SelectType) {
				case 0:
					OnPowA();
				break;
				case 1:
					OnPowB();
				break;
				case 2:
					OnPowC();
				break;
				case 3:
					OnPowD();
				break;
			}
		}
		
		public function OnPowA():void 
		{
			
		}
		
		public function OnPowB():void 
		{
			
		}
		
		public function OnPowC():void 
		{
			
		}
		
		public function OnPowD():void 
		{
			
		}
		
		override public function get CenterW():Number {
			return this.x + this.bitmapW / 2;
		}

		override public function get CenterH():Number {
			return this.y + this.bitmapH / 2;
		}
	}
}