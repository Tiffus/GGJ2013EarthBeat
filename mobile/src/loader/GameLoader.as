package loader
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.loading.SWFLoader;
	import com.greensock.TweenMax;
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
		private var _fond:Shape;
		
		public function GameLoader()
		{
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		}
		
		private function _onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			_fond = new Shape();
			_fond.graphics.beginFill(0xFFFFFF);
			_fond.graphics.drawRect(0, 0, 1024, 768);
			addChild(_fond);
			
			_carre = new Shape();
			_carre.graphics.beginFill(0x000000);
			_carre.graphics.drawRect(0, 0, 1024, 768);
			_carre.scaleX = 0;
			
			addChild(_carre);
			
			var swfLoader:SWFLoader = new SWFLoader("Hearth.swf", {onComplete: onLoadComplete, onProgress: _onLoaderUpdate});
			swfLoader.load();
		}
		
		private function _onLoaderUpdate(e:LoaderEvent):void
		{
			trace("GameLoader._onLoaderUpdate > e : " + e);
			var newScale:Number = (e.currentTarget as SWFLoader).progress;
			TweenMax.to(_carre, 0.3, {scaleX: newScale});
		}
		
		private function onLoadComplete(e:LoaderEvent):void
		{
			
			while (numChildren>0) 
			{
				removeChildAt(0);
			}
			
			var game:ContentDisplay = (e.currentTarget as SWFLoader).content;
			stage.addChild(game);
		}
	
	}

}