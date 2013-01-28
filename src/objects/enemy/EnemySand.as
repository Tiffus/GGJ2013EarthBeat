package objects.enemy
{
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class EnemySand extends AbstractEnemy
	{
		private var nbFrame:int = 150;
		private var currentFrameEnemyFire:int = 0;
		
		public function EnemySand(id_:int, type_:int, position_:int)
		{
			super(id_, type_, position_);
		}
		
		public function init():void
		{
			texture = Texture.fromBitmap(new Assets.sandTexture);
			var XMLData:XML = XML(new Assets.sandData());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, XMLData);
			_mc = new MovieClip(textureAtlas.getTextures("quicksandfinal"), 20);
			addChild(_mc);
			Starling.juggler.add(_mc);
			
			_mc.x = -_mc.width >> 1;
			_mc.y = -830;
			
			currentFrameEnemyFire = nbFrame;
			
			_mc.addEventListener(Event.ENTER_FRAME, _onEnterFrame);
		}
		
		private function _onEnterFrame(e:Event):void
		{
			currentFrameEnemyFire < 0 ? currentFrameEnemyFire = nbFrame : currentFrameEnemyFire--;
			
			if (!this.close)
			{
				if (currentFrameEnemyFire < 100)
				{
					_mc.currentFrame = 0;
					_mc.pause();
					active = false;
				}
				else
				{
					_mc.play();
					active = true;
				}
			}
		
		}
		
		override public function toString():String
		{
			return "EnemySand id:" + id + " t:" + type + " p:" + position;
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
		
		}
	}

}