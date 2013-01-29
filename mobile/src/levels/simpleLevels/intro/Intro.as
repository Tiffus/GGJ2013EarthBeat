package levels.simpleLevels.intro
{
	import levels.simpleLevels.AbstractSimpleLevel;
	import levels.simpleLevels.intro.elements.IntroBG;
	import levels.simpleLevels.intro.elements.IntroButton;
	import levels.simpleLevels.intro.elements.IntroLogo;
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Intro extends AbstractSimpleLevel
	{
		private var logo:IntroLogo;
		private var button:IntroButton;
		private var bg:IntroBG;
		
		public function Intro()
		{
			
			super();
		
		}
		
		override protected function _onremovedFromStage(e:Event):void
		{
			super._onremovedFromStage(e);
			
			bg.destroy();
			logo.destroy();
			button.destroy();
		}
		
		override protected function _init():void
		{
			
			bg = new IntroBG();
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
			
			super._init();
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			
			if (alpha == 1)
			{
				logo.alpha += 0.01;
				if (logo.alpha > 0.5)
				{
					button.alpha += 0.01;
				}
			}
			
			super.render(support, parentAlpha);
		}
		
		override protected function _finishChangeStage(stageName:String = null):void
		{
			super._finishChangeStage(GlobalContent.SCREEN_TUTO);
		}
	
	}

}