package objects.ondes
{
	import com.adobe.nativeExtensions.Vibration;
	import flash.display.Bitmap;
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	
	public class OndePNG extends Sprite
	{
		public var lastOneOfThePattern:Boolean;
		private var _id:int;
		private var _time:Number;
		private var _speed:Number;
		private var _sound:String;
		private var _color:String;
		private var _toDestroy:Boolean;
		private var _event:OndeEvent;
		private var _stateLigne:int = 0; //0: avant perso, 1:sur perso, 2 apres perso
		private var _playerHit:Boolean = false;
		private var _ondeGraphic:Image;
		private var _texture:Texture;
		
		public function OndePNG(id:Number, time:Number, speed:Number, color:String, sound:String)
		{
			_sound = sound;
			_color = color;
			_speed = speed;
			_time = time;
			_id = id;
			
			addEventListener(Event.ADDED_TO_STAGE, _init);
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemoveFromStage);
		}
		
		private function _onRemoveFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemoveFromStage);
			_texture.dispose();
			_texture = null;
			
			removeChild(_ondeGraphic);
			_ondeGraphic = null;
		}
		
		private function _init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			
			switch (_color)
			{
				
				case GlobalContent.BLEU: 
					_texture = Texture.fromBitmap(new Assets.BlueRays() as Bitmap);
					break;
				case GlobalContent.BLANC: 
					_texture = Texture.fromBitmap(new Assets.WhiteRays() as Bitmap);
					break;
				default: 
					_texture = Texture.fromBitmap(new Assets.BlueRays());
			}
			
			_ondeGraphic = new Image(_texture);
			_ondeGraphic.width = _ondeGraphic.height = 3000;
			_ondeGraphic.x = _ondeGraphic.y = -_ondeGraphic.width >> 1;
			scaleX = scaleY = 0.2;
			addChild(_ondeGraphic);
		}
		
		public function destroy():void
		{
			if (lastOneOfThePattern)
			{
				dispatchEvent(new OndeEvent(OndeEvent.LAST_ONE_DESTROYED));
				
				trace("OndeEvent.LAST_ONE_DESTROYED");
			}
			
			Starling.juggler.removeTweens(this);
		
		}
		
		public function reinit():void
		{
			scaleX = scaleY = 0.2;
			_toDestroy = false;
			stateLigne = 0;
			alpha = 1;
		}
		
		public function animate():void
		{
			trace("OndePNG.animate");
			Starling.juggler.tween(this, _speed, {scaleX: 1, scaleY: 1, onComplete: _onComplete, delay: _time});
		}
		
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			if (GlobalContent.RAYON_MAX_WAVE * scaleX > 640)
			{
				stateLigne = 2;
				this.alpha -= 0.02;
			}
			
			if (GlobalContent.RAYON_MAX_WAVE * scaleX > 530 && stateLigne == 0)
			{
				stateLigne = 1;
				GlobalContent.currentOnde = this;
				_event = new OndeEvent(OndeEvent.TOUCH_CHARACTER);
				
				Starling.current.dispatchEvent(_event);
				
			}
		}
		
		private function _onComplete():void
		{
			Starling.current.dispatchEvent(new OndeEvent(OndeEvent.DESTROY));
			destroy();
		}
		
		/////////////////////////////////////////////////////////////////////
		// GETTER / SETTER
		/////////////////////////////////////////////////////////////////////
		
		public function get time():Number
		{
			return _time;
		}
		
		public function get sound():String
		{
			return _sound;
		}
		
		public function get color():String
		{
			return _color;
		}
		
		public function get speed():Number
		{
			return _speed;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get playerHit():Boolean
		{
			return _playerHit;
		}
		
		public function set playerHit(value:Boolean):void
		{
			_playerHit = value;
		}
		
		public function get stateLigne():int
		{
			return _stateLigne;
		}
		
		public function set stateLigne(value:int):void
		{
			_stateLigne = value;
		}
		
		public function toString():String
		{
			return "Wave id:" + id + " s:" + speed + " c:" + color;
		}
	
	}

}