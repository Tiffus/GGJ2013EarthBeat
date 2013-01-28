package objects.enemy
{
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class EnemyFire extends AbstractEnemy
	{
		
		private var nbFrame:int = 1500;
		private var currentFrameEnemyFire:int = 0;
		private var lastFrame:int;
		
		public function EnemyFire(id_:int, type_:int, position_:int)
		{
			super(id_, type_, position_);
		}
		
		public function init():void
		{
			texture = Texture.fromBitmap(new Assets.fireTexture());
			var XMLData:XML = XML(new Assets.fireData());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, XMLData);
			_mc = new MovieClip(textureAtlas.getTextures("firepillarfinal"), 20);
			addChild(_mc);
			
			_mc.x = -_mc.width >> 1;
			_mc.y = -905;
			currentFrameEnemyFire = nbFrame;
			
			Starling.juggler.add(_mc);
		
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			if (_mc.currentFrame < 60 || _mc.currentFrame > 140)
			{
				active = false;
			}
			else
			{
				
				active = true;
			}
		}
	
	}
}