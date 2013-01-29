package loader
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.loading.SWFLoader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class GameLoader extends Sprite
	{
		private var _carre:Shape;
		
		public function GameLoader()
		{
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		}
		
		private function _onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			var swfLoader:SWFLoader = new SWFLoader("Hearth.swf", {onComplete: onLoadComplete, onUpdate: _onLoaderUpdate});
			swfLoader.load(true);
			
			_carre = new Shape();
			_carre.graphics.beginFill(0xFFFFFF);
			_carre.scaleX = 0;
		}
		
		private function _onLoaderUpdate(e:LoaderEvent):void
		{
			_carre.scaleX = (e.currentTarget as SWFLoader).progress;
		}
		
		private function onLoadComplete(e:LoaderEvent):void
		{
			var game:ContentDisplay = (e.currentTarget as SWFLoader).content;
			stage.addChild(game);
		}
	
	}

}