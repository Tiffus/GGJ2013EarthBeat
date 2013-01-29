package levels.simpleLevels.win
{
	import levels.simpleLevels.AbstractSimpleLevel;
	import levels.simpleLevels.win.elements.WinBG;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Souheil
	 */
	public class Win extends AbstractSimpleLevel
	{
		private var bg:WinBG;
		
		public function Win()
		{
			_init();
		}
		
		override protected function _onremovedFromStage(e:Event):void
		{
			super._onremovedFromStage(e);
			bg.destroy();
		}
		
		override protected function _init():void
		{
			bg = new WinBG();
			addChild(bg);
		
			super._init();
		}
		
		override protected function _finishChangeStage(stageName:String = null):void
		{
			super._finishChangeStage(GlobalContent.SCREEN_CREDIT);
		}
	
	}

}