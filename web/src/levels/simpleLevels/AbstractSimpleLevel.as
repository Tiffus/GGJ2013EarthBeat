package levels.simpleLevels
{
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class AbstractSimpleLevel extends Sprite
	{
		
		public function AbstractSimpleLevel()
		{
			_init();
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onremovedFromStage);
		
		}
		
		protected function _onremovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onremovedFromStage);
		
		}
		
		protected function _init():void
		{
			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			
			alpha = 0;
			Starling.juggler.tween(this, 1, {alpha: 1});
		}
		
		private function _onClick(e:MouseEvent):void
		{
			
			_changeStage();
		
		}
		
		private function _onKeyUp(e:KeyboardEvent):void
		{
			_changeStage();
		}
		
		/////////////////////////////////////////////////////////////////////
		// CHANGE STAGE
		/////////////////////////////////////////////////////////////////////
		
		private function _changeStage():void
		{
			Starling.juggler.tween(this, 1, {alpha: 0, onComplete: _finishChangeStage});
			
			Starling.current.nativeStage.removeEventListener(MouseEvent.CLICK, _onClick);
			Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
		
		}
		
		protected function _finishChangeStage(stageName:String = null):void
		{
			if (!stageName)
			{
				trace("AbstractSimpleLevel._finishChangeStage > stageName : " + stageName);
				trace("Must be overriden");
			}
			else
			{
				var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
				event.nextSceneName = stageName;
				dispatchEvent(event);
			}
		
		}
	}

}