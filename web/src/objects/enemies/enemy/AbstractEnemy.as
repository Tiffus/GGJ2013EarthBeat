package objects.enemies.enemy
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class AbstractEnemy extends Sprite
	{
		public var id:int;
		public var type:int;
		public var position:int;
		private var _active:Boolean;
		
		protected var _image:Image;
		protected var texture:Texture;
		
		protected var _mc:MovieClip;
		protected var _close:Boolean;
		
		public function AbstractEnemy(id_:int, type_:int, position_:int)
		{
			
			this.id = id_;
			this.type = type_;
			this.position = position_;
			this.active = true;
			
			_init();
		}
		
		private function _init():void
		{
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}
		
		private function _onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			texture.dispose();
		}
		
		public function toString():String
		{
			trace("AbstractEnemy.toString");
			return "AbstractEnemy id:" + id + " t:" + type + " p:" + position + " f:" + _mc.currentFrame + " a:" + _active;
		}
		
		public function get image():Image
		{
			return _image;
		}
		
		public function get active():Boolean
		{
			return _active;
		}
		
		public function set active(value:Boolean):void
		{
			_active = value;
		}
		
		public function get mc():MovieClip
		{
			return _mc;
		}
		
		public function get close():Boolean
		{
			return _close;
		}
		
		public function set close(value:Boolean):void
		{
			_close = value;
		}
		
		public function inactivate():void
		{
			trace("AbstractEnemy.inactivate");
			_mc.currentFrame = 0;
			Starling.juggler.remove(_mc);
			this.active = false;
			this.close = true;
		}
	
	}

}