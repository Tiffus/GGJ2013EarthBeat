package objects.characters.character
{
	import objects.enemies.enemy.AbstractEnemy;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author ld
	 */
	public class AbstractChar extends Sprite
	{
		public var dead:Boolean;
		protected var _image:Image;
		protected var _mc:MovieClip;
		protected var texture:Texture;
		protected var _container:Sprite
		
		public function AbstractChar()
		{
			super();
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}
		
		private function _onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			texture.dispose();
		}
		
		public function collideWithEnemy(e:AbstractEnemy):Boolean
		{
			if (this.getBounds(image).intersects(e.getBounds(e.image)))
			{
				trace(this.getBounds(image).toString + " " + this.getBounds(e.image).toString);
				return true;
			}
			return false;
		}
		
		/////////////////////////////////////////////////////////////////////
		// ANIMATION
		/////////////////////////////////////////////////////////////////////
		
		public function startAnimation():void
		{
			if (!Starling.juggler.contains(_mc))
			{
				Starling.juggler.add(_mc);
			}
		}
		
		public function stopAnimation():void
		{
			if (Starling.juggler.contains(_mc))
			{
				Starling.juggler.remove(_mc);
			}
		}
		
		/////////////////////////////////////////////////////////////////////
		// GETTER / SETTER
		/////////////////////////////////////////////////////////////////////
		public function get image():Image
		{
			return _image;
		}
		
		public function get container():Sprite
		{
			return _container;
		}
		
		public function get mc():MovieClip
		{
			return _mc;
		}
	
	}

}