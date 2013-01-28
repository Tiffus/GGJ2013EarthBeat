package levels
{
	
	import events.SceneChangeEvent;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class SecondLevel extends AbstractLevel
	{
		
		public function SecondLevel()
		{
		
		}
		
		override protected function _init(e:Event):void
		{
			super._init(e);
			GlobalContent.levelLoader.loadLevel(1);
		}
		
		override protected function _onXMLLevelLoaded(e:Event):void
		{
			_textureBG = Texture.fromBitmap(new Assets.bg2);
			_texture = Texture.fromBitmap(new Assets.planetAsset2());
			
			super._onXMLLevelLoaded(e);
			
			//Text
			var text:TextField = new TextField(200, 50, "Fear", "Verdana", 36, 0xFFFFFF);
			text.alpha = 0.5;
			text.x = text.y = 10;
			addChild(text);
		}
		
		override protected function onFinishHide():void
		{
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			//event.nextSceneName = GlobalContent.SCREEN_TITLE;
			event.nextSceneName = GlobalContent.SCREEN_THIRD;
			dispatchEvent(event);
		}
	
	}

}