package objects.enemy
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Enemy extends Sprite
	{
		public var id:int;
		public var type:int;
		public var position:int;
		
		public function Enemy(id_:int, type_:int, position_:int)
		{
			this.id = id_;
			this.type = type_;
			this.position = position_;
		
		}
		
		public function toString():String
		{
			return "Obstacle id:" + id + " t:" + type + " p:" + position;
		}
	
	}

}