package objects.characters
{
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Char4 extends AbstractChar
	{
		
		public function Char4()
		{
			super();
			_init();
		}
		
		private function _init():void
		{
			texture = Texture.fromBitmap(new Assets.SonTexture());
			var XMLData:XML = XML(new Assets.SonData());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, XMLData);
			 _mc = new MovieClip(textureAtlas.getTextures("SonAnim"), 20);
			addChild(_mc);
			Starling.juggler.add(_mc);
			
			_container = new Sprite();
			_container.addChild(_mc);
			addChild(_container);
			
			_mc.x -= _mc.width >> 1;
			_mc.y -= _mc.width >> 1;
			
			container.x = -container.width >> 1;
			container.y = -805;
		
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
		}
	}
}