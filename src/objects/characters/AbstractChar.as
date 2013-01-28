package objects.characters
{
	import objects.collision.CollisionPair;
	import objects.enemy.AbstractEnemy;
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
		private var currentColor:String = GlobalContent.BLACK;
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
				trace(this.getBounds(image).toString+" "+this.getBounds(e.image).toString);
				return true;
			}
			return false;
		}
		
		public function get image():Image
		{
			return _image;
		}
		
		public function get container():Sprite
		{
			return _container;
		}
	
	}

}