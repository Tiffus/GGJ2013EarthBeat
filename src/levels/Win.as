package levels
{
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import levels.win.WinBG;
	import levels.win.WinBG;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Souheil
	 */
	public class Win extends Sprite
	{
		
		public function Win()
		{
			_init();
		}
		
		private function _init():void
		{
			var bg:WinBG = new WinBG();
			addChild(bg);
			
			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		}
		
		private function _onClick(e:MouseEvent):void
		{
			trace("WinBG._onClick > e : " + e);
			_changeStage();
		}
		
		private function _onKeyUp(e:KeyboardEvent):void
		{
			_changeStage();
		}
		
		private function _changeStage():void
		{
			trace("WinBG._changeStage");
			Starling.current.nativeStage.removeEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_CREDIT;
			dispatchEvent(event);
		}
	}

}