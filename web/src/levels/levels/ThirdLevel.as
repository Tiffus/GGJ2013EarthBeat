package levels.levels
{
	
	import events.SceneChangeEvent;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class ThirdLevel extends AbstractLevel
	{
		
		public function ThirdLevel()
		{
		
		}
		
		override protected function _init(e:Event):void
		{
			super._init(e);
			GlobalContent.levelLoader.loadLevel(2);
		}
		
		override protected function _onXMLLevelLoaded(e:Event):void
		{
			_textureBG = Texture.fromBitmap(new Assets.bg3);
			_texture = Texture.fromBitmap(new Assets.planetAsset3());
			
			super._onXMLLevelLoaded(e);
			
			//Text
			_makeText("Hope");
		}
		
		override protected function _onFinishHide():void
		{
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_FINAL;
			dispatchEvent(event);
		}
	
	}

}