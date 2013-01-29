package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	
	[SWF(width="1024", height="768", backgroundColor="#000000", frameRate="60")]
	
	public class Main extends Sprite
	{
		
		private var _starling:Starling;
		
		public function Main():void
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//Stage properties
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			
			trace("Main._onLevelLoaded > e : " + e);
			//Starling
			_starling = new Starling(Game, stage);
			_starling.start();
		
			
			//_starling.viewPort = new Rectangle(0,0,2560,1600);
		}
	
	}

}