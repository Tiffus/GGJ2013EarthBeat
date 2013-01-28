package objects
{
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Background extends Sprite
	{
		private var textureBG:Texture;
		
		public function Background(textureBG:Texture)
		{
			this.textureBG = textureBG;
			_init();
		}
		
		public function destroy():void 
		{
			textureBG.dispose();
		}
		
		private function _init():void
		{
		
			var background:Image = new Image(textureBG);

			addChildAt(background, 0)
		}
	
	}

}