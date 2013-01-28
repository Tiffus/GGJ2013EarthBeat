package objects
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Planet extends Sprite
	{
		private var enemies:Enemies;
		private var texture:Texture;
		
		public function Planet(texture:Texture)
		{
			this.texture = texture;
			_init();
		}
		
		public function destroy():void 
		{
			texture.dispose();
			enemies.dispose();
		}
		
		private function _init():void
		{
			
			var background:Image = new Image(texture);
			
			background.x = -background.width >> 1;
			background.y = -background.height >> 1;
			
			addChildAt(background, 0);
			
			//ENEMIES
			enemies = new Enemies();
			addChild(enemies);
		}
	
	}

}