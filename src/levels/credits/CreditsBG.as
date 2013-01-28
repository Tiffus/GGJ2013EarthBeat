package levels.credits
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class CreditsBG extends Sprite
	{
		[Embed(source="../../../assets/img/credits_screen.png")]
		private var OpeningTexture:Class;
		private var texture:Texture;
		private var image:Image;
		
		public function CreditsBG()
		{
			_init();
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}
		
		private function _onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			
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