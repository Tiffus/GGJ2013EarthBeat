package levels
{
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import levels.credits.CreditsBG;
	import levels.tuto.TutoBG;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Credits extends Sprite
	{
		
		public function Credits()
		{
			_init();
		}
		
		private function _init():void
		{
			var bg:CreditsBG = new CreditsBG();
			addChild(bg);
			
			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		}
		
		private function _onClick(e:MouseEvent):void
		{
			trace("TutoBG._onClick > e : " + e);
			_changeStage();
		}
		
		private function _onKeyUp(e:KeyboardEvent):void
		{
			_changeStage();
		}
		
		private function _changeStage():void
		{
			trace("TutoBG._changeStage");
			Starling.current.nativeStage.removeEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_TITLE;
			dispatchEvent(event);
		}
	}

}