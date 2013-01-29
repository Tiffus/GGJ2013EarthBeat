package levels.levels
{
	
	import events.SceneChangeEvent;
	import objects.Core;
	import starling.events.Event;
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
			_makeText("Love !");
			
			var core:Core = new Core();
			core.x = 512;
			core.y = 768;
			addChild(core);
		}
		
		override protected function _onFinishHide():void
		{
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_WIN;
			dispatchEvent(event);
		}
	
	}

}