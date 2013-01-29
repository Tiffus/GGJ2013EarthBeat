package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import starling.core.Starling;
	
	/**
	 *    ______)                    /
	 *   (, /   ,  /) /)            /
	 *     /      // //     _      /
	 *  ) /   _(_/(_/(_(_(_/_)_   o
	 * (_/      /) /)
	 *         (/ (/
	 *
	 * 29/01/2013 20:24
	 *
	 * @author Tiffus (mailto:ilcyaa@gmail.com) ^^
	 */
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			//Starling
			
			GlobalContent.fullScreenWidth = stage.fullScreenWidth;
			
			var screenWidth:int = (stage.fullScreenWidth * 768) / 1024;
			var screenHeight:int = stage.fullScreenHeight;
			var viewport:Rectangle = new Rectangle((stage.fullScreenWidth - screenWidth) >> 1, 0, screenWidth, screenHeight);
			
			var starling:Starling = new Starling(Game, stage, viewport);
			starling.start();
			
			starling.stage.stageWidth = 1024;
			starling.stage.stageHeight = 768;
		
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function deactivate(e:Event):void
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
	
	}

}