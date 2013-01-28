package levels.intro
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
		
		[Embed(source="../../../assets/img/logo-earthbeat-blue.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		
		public function IntroLogo()
		{
			_init();
		}
		
		public function destroy():void 
		{
			texture.dispose();
		}
		
		private function _init():void
		{
			texture = Texture.fromBitmap(new OpeningTexture());
			var image:Image = new Image(texture);
			
			image.x = -image.width >> 1;
			
			addChild(image);
		}
	
	}

}