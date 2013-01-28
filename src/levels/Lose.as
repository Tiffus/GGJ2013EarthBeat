package levels
{
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import levels.lose.LoseBG;
	import levels.lose.LoseBG;
	import starling.core.Starling;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Souheil
	 */
	public class Lose extends Sprite
	{
		
		public function Lose()
		{
			_init();
		}
		
		private function _init():void
		{
			var bg:LoseBG = new LoseBG();
			addChild(bg);
			
			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		}
		
		private function _onClick(e:MouseEvent):void
		{
			trace("LoseBG._onClick > e : " + e);
			_changeStage();
		}
		
		private function _onKeyUp(e:KeyboardEvent):void
		{
			_changeStage();
		}
		
		private function _changeStage():void
		{
			trace("LoseBG._changeStage");
			Starling.current.nativeStage.removeEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_TITLE;
			dispatchEvent(event);
		}
	}

}