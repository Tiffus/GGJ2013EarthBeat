package objects
{
	import starling.core.RenderSupport;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Core extends Sprite
	{
		private var _top:Number = 1;
		private var _image:Image;
		private var _texture:Texture;
		
		public function Core()
		{
			_init();
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}
		
		private function _onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			
			_image.dispose();
			_image = null;
			_texture.dispose();
			_texture = null;
		}
		
		private function _init():void
		{
			_texture = Texture.fromBitmap(new Assets.coreImg());
			_image = new Image(_texture);
			
			addChild(_image);
			
			_image.x = -(_texture.width >> 1) * _image.scaleX;
			_image.y = -(_texture.height >> 1) * _image.scaleY + 20;
		
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			this.rotation += 0.01;
			_top += 0.01;
			this.scaleX = this.scaleY = Math.abs(Math.cos(_top)) + 1;
		}
	
	}

}