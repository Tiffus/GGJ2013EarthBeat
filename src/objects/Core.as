package objects
{
	import starling.core.RenderSupport;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Core extends Sprite
	{
		private var _mc:MovieClip;
		private var image:Image;
		
		public function Core()
		{
			_init();
		}
		
		private function _init():void
		{
			var texture:Texture = Texture.fromBitmap(new Assets.coreImg());
			image = new Image(texture);
			
			addChild(image);
			
			
			image.x = -(texture.width >> 1)*image.scaleX;
			image.y = -(texture.height >> 1)*image.scaleY +20;
		
			//image.scaleX = image.scaleY = 2;
		}
		private var top:Number = 1;
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			this.rotation += 0.01;
			top += 0.01;
			this.scaleX = this.scaleY = Math.abs(Math.cos(top))+1;
		}
	
	}

}