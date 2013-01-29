package levels.simpleLevels.tuto
{
	import levels.simpleLevels.AbstractSimpleLevel;
	import levels.simpleLevels.tuto.elements.TutoBG;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Tuto extends AbstractSimpleLevel
	{
		private var bg:TutoBG;
		
		public function Tuto()
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
			bg = new TutoBG();
			addChild(bg);
			
			super._init();
		}
		
		override protected function _finishChangeStage(stageName:String = null):void
		{
			super._finishChangeStage(GlobalContent.SCREEN_MAIN);
		}
	}

}