package levels.simpleLevels.credits
{
	import levels.simpleLevels.credits.elements.CreditsBG;
	import levels.simpleLevels.AbstractSimpleLevel;
	import levels.simpleLevels.credits.elements.CreditsBG;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Credits extends AbstractSimpleLevel
	{
		private var bg:CreditsBG;
		
		public function Credits()
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
			bg = new CreditsBG();
			addChild(bg);
			
			super._init();
		}
		
		override protected function _finishChangeStage(stageName:String = null):void
		{
			super._finishChangeStage(GlobalContent.SCREEN_TITLE);
		}
	}

}