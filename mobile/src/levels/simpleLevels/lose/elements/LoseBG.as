package levels.simpleLevels.lose.elements
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
	 * @author Souheil
	 */
	public class LoseBG extends Sprite
	{
		[Embed(source="../../../../../assets/img/gameover.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		private var image:Image;
		
		public function LoseBG()
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
			
			addChildAt(image, 0);
			
		
		}
		
		
	
	}

}