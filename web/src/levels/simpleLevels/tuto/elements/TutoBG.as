package levels.simpleLevels.tuto.elements
{
	import events.SceneChangeEvent;
	import flash.events.MouseEvent;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class TutoBG extends Sprite
	{
		[Embed(source="../../../../../assets/img/tutorial-Earthbeat-01.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		
		public function TutoBG()
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
			
			addChildAt(image, 0);
			
		
		}
		
		
	
	}

}