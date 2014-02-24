package Konata2 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import KO.K;
	import KO.KEntity;
	import KO.KRectangleEntity;
	
	public class Rect1 extends KRectangleEntity 
	{
		public function Rect1(){
			super(0, 0, 200, 100);
			
			draw(0x00ff46, .4);
		}
		
	}

}