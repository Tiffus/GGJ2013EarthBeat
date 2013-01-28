package levels
{
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import levels.intro.IntroBG;
	import levels.intro.IntroButton;
	import levels.intro.IntroLogo;
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Intro extends Sprite
	{
		private var logo:IntroLogo;
		private var button:IntroButton;
		
		public function Intro()
		{
			_init();
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onremovedFromStage);
		}
		
		private function _onremovedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onremovedFromStage);
			logo.destroy();
			button.destroy();
		}
		
		private function _init():void
		{
			var bg:IntroBG = new IntroBG();
			addChild(bg);
			
			logo = new IntroLogo();
			logo.x = Starling.current.stage.stageWidth >> 1;
			logo.y = 50;
			logo.alpha = 0;
			addChild(logo);
			
			button = new IntroButton();
			button.x = Starling.current.stage.stageWidth >> 1;
			button.y = Starling.current.stage.stageHeight - button.height;
			button.alpha = 0;
			addChild(button);
			
			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			
			if (logo.alpha == 1)
			{
				button.alpha += 0.01;
			}
			logo.alpha += 0.01;
			
			super.render(support, parentAlpha);
		}
		
		private function _onClick(e:MouseEvent):void
		{
			_changeStage();
		}
		
		private function _onKeyUp(e:KeyboardEvent):void
		{
			_changeStage();
		}
		
		private function _changeStage():void
		{
			Starling.current.nativeStage.removeEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_TUTO;
			dispatchEvent(event);
		}
	
	}

}