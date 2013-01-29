package levels.simpleLevels.credits.elements
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class CreditsBG extends Sprite
	{
		[Embed(source="../../../../../assets/img/credits_screen.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		private var image:Image;
		
		public function CreditsBG()
		{
			_init();
		
		}
		
		public function destroy():void
		{
			texture.dispose();
			texture = null;
			
			removeChild(image);
			image = null;
		}
		
		private function _init():void
		{
			texture = Texture.fromBitmap(new OpeningTexture());
			image = new Image(texture);
			
			addChildAt(image, 0);
		}
	
	}

}