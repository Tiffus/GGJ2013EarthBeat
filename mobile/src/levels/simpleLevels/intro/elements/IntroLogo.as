package levels.simpleLevels.intro.elements
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class IntroLogo extends Sprite
	{
		
		[Embed(source="../../../../../assets/img/logo-earthbeat-blue.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		private var image:Image;
		
		public function IntroLogo()
		{
			_init();
		}
		
		public function destroy():void
		{
			texture.dispose();
			texture = null;
			image.dispose();
			image = null;
		}
		
		private function _init():void
		{
			texture = Texture.fromBitmap(new OpeningTexture());
			image = new Image(texture);
			
			image.x = -image.width >> 1;
			
			addChild(image);
		}
	
	}

}