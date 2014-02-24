package Konata.Arms 
{
	import KO.KCircleEntity;
	import Konata.G;
	
	public class MagicB extends KCircleEntity 
	{
		public function MagicB(x:Number,y:Number)
		{
			super(x, y, 4);
			//this.angle = Math.random() * 360 * K.MPI180;
			speed = 2;
			
			draw(0xdd00aa, .8);
		}
		
		override public function update():void
		{
			vx = Math.cos(angle) * speed;
			vy = Math.sin(angle) * speed;
			
			if (this.x < G.OverX || this.x >= G.OverW
			|| this.y < G.OverY || this.y >= G.OverH) {
				K.game.remove(this);
			}
		}
	}

}