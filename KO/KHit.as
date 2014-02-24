package KO {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import KO.KEntity;
	
	public class KHit {
		
		public function KHit() {
			
		}
		
		public static function RectHitPoint(obj:KRectangleEntity, p:Point):Boolean {
			return (p.x > obj.x && p.x < obj.x + obj.width
			&& p.y > obj.y && p.y < obj.y + obj.height);
		}
		
		public static function RectHitXY(obj:Rectangle, x:Number,y:Number):Boolean {
			return (x > obj.x && x < obj.x + obj.width
			&& y > obj.y && y < obj.y + obj.height);
		}
		
		public static function CircleHitPoint(obj:KCircleEntity, p:Point):Boolean {
			var dx:Number = p.x - obj.x;
			var dy:Number = p.y - obj.y;
			var r:Number = obj.radius;
			return (Math.abs(dx) < r && Math.abs(dy) < r)
		}
		
		public static function HitHorizontal(char:KRectangleEntity, obj:KRectangleEntity):Boolean {
			return (char.y + char.height > obj.y
			&& char.y < obj.y + obj.height
			&& char.vx + char.x < obj.x + obj.width
			&& char.vx + char.x + char.width > obj.x);
		}
		
		public static function HitVertical(char:KRectangleEntity, obj:KRectangleEntity):Boolean {
			return (char.x + char.width > obj.x
			&& char.x < obj.x + obj.width
			&& char.vy + char.y < obj.y + obj.height
			&& char.vy + char.y + char.height > obj.y);
		}
		
		public static function RectHitRect(ra:KRectangleEntity, rb:KRectangleEntity):Boolean {
			var RectX:Number = ra.x, RectY = ra.y, RectWidth = ra.width, RectHeight = ra.height
			var ObjX:Number = rb.x, ObjY = rb.y, ObjWidth = rb.width, ObjHeight = rb.height;
			
			return ((RectX + RectWidth > ObjX) && (RectX < ObjX + ObjWidth) &&
				(RectY + RectHeight > ObjY) && (RectY < ObjY + ObjHeight));
		}
		
		public static function CircleHitCircle(ca:KCircleEntity, cb:KCircleEntity):Boolean {
			var dx:Number = ca.x - cb.x;
			var dy:Number = ca.y - cb.y;
			var w0:int = ca.radius + cb.radius;
			var w1:Number = Math.sqrt(dx * dx + dy * dy);
			return (w1 <= w0);
		}
		
		public static function RectHitCircle(ra:KRectangleEntity, ca:KCircleEntity):Boolean {
			var rx:Number = ca.x - (ra.x + ra.halfWidth);
			var ry:Number = ca.y - (ra.y + ra.halfHeight);
			
			var dx:Number = Math.min(rx, ra.halfWidth);
			dx = Math.max(dx, -ra.halfWidth);
			var dy:Number = Math.min(ry, ra.halfHeight);
			dy = Math.max(dy, -ra.halfHeight);
			rx = rx - dx;
			ry = ry - dy;
			return rx * rx + ry * ry < ca.radius * ca.radius;
		}
		
		//public function clampHorizontal(param1:Number, param2:Number, param3:Number = 0) : void
        //{
            //if (this.x - this.originX < param1 + param3)
            //{
                //this.x = param1 + this.originX + param3;
            //}
            //if (this.x - this.originX + this.width > param2 - param3)
            //{
                //this.x = param2 - this.width + this.originX - param3;
            //}
            //return;
        //}
		
        //public function clampVertical(param1:Number, param2:Number, param3:Number = 0) : void
        //{
            //if (this.y - this.originY < param1 + param3)
            //{
                //this.y = param1 + this.originY + param3;
            //}
            //if (this.y - this.originY + this.height > param2 - param3)
            //{
                //this.y = param2 - this.height + this.originY - param3;
            //}
            //return;
        //}
	}
}