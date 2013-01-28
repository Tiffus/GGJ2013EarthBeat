package levels
{
	
	import events.SceneChangeEvent;
	import objects.Core;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class LastLevel extends AbstractLevel
	{
		
		public function LastLevel()
		{
		
		}
		
		override protected function _init(e:Event):void
		{
			super._init(e);
			GlobalContent.levelLoader.loadLevel(3);
		}
		
		override protected function _onXMLLevelLoaded(e:Event):void
		{
			_textureBG = Texture.fromBitmap(new Assets.bgfinal);
			_texture = Texture.fromBitmap(new Assets.LastPlanetAsset());
			
			super._onXMLLevelLoaded(e);
			
			//Text
			var text:TextField = new TextField(200, 50, "Love !", "Verdana", 36, 0xFFFFFF);
			text.alpha = 0.5;
			text.x = text.y = 10;
			addChild(text);
			
			var core:Core = new Core();
			core.x = 512;
			core.y = 768;
			addChild(core);
		}
		
		override protected function onFinishHide():void
		{
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_WIN;
			//event.nextSceneName = GlobalContent.SCREEN_TITLE;
			dispatchEvent(event);
		}
	
	}

}