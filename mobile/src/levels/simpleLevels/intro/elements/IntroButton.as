package levels.simpleLevels.intro.elements
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class IntroButton extends Sprite
	{
		[Embed(source="../../../../../assets/img/opening_start_msg.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		
		public function IntroButton()
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
			
			addChildAt(image, 0);
		}
	
	}

}