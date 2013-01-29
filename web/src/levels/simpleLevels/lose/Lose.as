package levels.simpleLevels.lose
{
	import levels.simpleLevels.AbstractSimpleLevel;
	import levels.simpleLevels.lose.elements.LoseBG;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Souheil
	 */
	public class Lose extends AbstractSimpleLevel
	{
		private var bg:LoseBG;
		
		public function Lose()
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
			bg = new LoseBG();
			addChild(bg);
			
			super._init();
		}
		
		override protected function _finishChangeStage(stageName:String = null):void
		{
			super._finishChangeStage(GlobalContent.SCREEN_TITLE);
		}
	}

}