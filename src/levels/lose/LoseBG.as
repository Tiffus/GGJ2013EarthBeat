package levels.lose
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
		[Embed(source="../../../assets/img/gameover.png")]
		private var OpeningTexture:Class;
		
		public function LoseBG()
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