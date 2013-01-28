package levels.win
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
	public class WinBG extends Sprite
	{
		[Embed(source = "../../../assets/img/win page.png")]
		private var OpeningTexture:Class;
		
		public function WinBG()
		{
			_init();
		}
		
		private function _init():void
		{
			var texture:Texture = Texture.fromBitmap(new OpeningTexture());
			var image:Image = new Image(texture);
			
			addChildAt(image, 0);
			
		
		}
		
		
	
	}

}