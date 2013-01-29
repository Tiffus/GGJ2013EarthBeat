package objects.feedback
{
	import starling.core.RenderSupport;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class FeedBack extends Sprite
	{
		private var texture:Texture;
		private var image:Image;
		
		public function FeedBack()
		{
			_init();
		}
		
		private function _init():void
		{
			texture = Texture.fromBitmap(new Assets.FeedBackAsset());
			image = new Image(texture);
			
			addChild(image);
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}
		
		private function _onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			texture.dispose();
		}
		
		public function activate(characterColor:String):void
		{
			
			switch (characterColor)
			{
				case GlobalContent.BLANC: 
					image.color = GlobalContent.BLANC_VALUE;
					break;
				case GlobalContent.BLEU: 
					image.color = GlobalContent.BLEU_VALUE;
					break;
				default: 
			}
			
			alpha = 1;
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			alpha -= 0.1;
		}
	
	}

}