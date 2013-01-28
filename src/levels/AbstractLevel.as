package levels
{
	import com.greensock.TweenMax;
	import events.GameEvent;
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import levelLoader.LoadLevelDesign;
	import objects.Background;
	import objects.Characters;
	import objects.characters.AbstractChar;
	import objects.enemy.AbstractEnemy;
	import objects.feedback.FeedBack;
	import objects.ondes.OndeEvent;
	import objects.ondes.OndePNGCreator;
	import objects.Planet;
	import sound.SoundPlayer;
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.rad2deg;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class AbstractLevel extends Sprite
	{
		
		private var hitPlayer:Boolean = false;
		static public const LEVELLOADER_LOADED:String = "levelloaderLoaded";
		static private const FORWARD_DEFAULT_ANGLE:Number = 10;
		
		//ASSETS
		private var planet:Planet;
		private var _characters:Characters;
		protected var _bg:Background;
		
		private var _feedback:FeedBack;
		private var ondeGenerator:OndePNGCreator;
		private var rotationComputation:Number;
		
		private var currentNbFrame:int = 0;
		private var nbFrameAvance:int = 30;
		protected var _texture:Texture;
		
		private var dernierPassage:Boolean = false;
		private var fixFinised:Boolean = false;
		protected var _textureBG:Texture;
		
		public function AbstractLevel()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
		}
		
		private function _onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			
			if (Starling.current.nativeStage.hasEventListener(KeyboardEvent.KEY_UP))
			{
				Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			}
			_texture.dispose();
			_bg.destroy();
			ondeGenerator.destroy();
		
		}
		
		private function _onGameOver(e:GameEvent = null):void
		{
			trace("Game._onGameOver > e : " + e);
			
			TweenMax.to(this, 0.5, {alpha: 0, onComplete: onFinishHideGameOver})
		
		}
		
		private function onFinishHideGameOver():void
		{
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_LOSE;
			dispatchEvent(event);
		}
		
		private function _onGameWin(e:GameEvent = null):void
		{
			trace("Game._onGameOver > e : " + e);
			
			TweenMax.to(this, 0.5, {alpha: 0, onComplete: onFinishHide})
		
		}
		
		protected function onFinishHide():void
		{
		
		}
		
		private function _onTouchCharacter(e:OndeEvent):void
		{
			SoundPlayer.playBattementComplet();
		
		}
		
		/////////////////////////////////////////////////////////////////////
		// KEYS
		/////////////////////////////////////////////////////////////////////
		private function _onKeyUp(e:KeyboardEvent):void
		{
			
			if (e.keyCode == Keyboard.S)
			{
				// bleu
				_feedback.activate(GlobalContent.BLEU);
				if (GlobalContent.currentOnde != null && !GlobalContent.currentOnde.playerHit && GlobalContent.currentOnde.color == "yellow" && GlobalContent.currentOnde.stateLigne == 1)
				{
					GlobalContent.currentOnde.playerHit = true;
					_moveForward();
				}
			}
			
			if (e.keyCode == Keyboard.L)
			{
				// blanche
				_feedback.activate(GlobalContent.BLANC);
				if (GlobalContent.currentOnde != null && !GlobalContent.currentOnde.playerHit && GlobalContent.currentOnde.color == "red" && GlobalContent.currentOnde.stateLigne == 1)
				{
					GlobalContent.currentOnde.playerHit = true;
					_moveForward();
				}
			}
		}
		
		/////////////////////////////////////////////////////////////////////
		// MOUVEMENT
		/////////////////////////////////////////////////////////////////////
		
		private function _moveForward():void
		{
			
			hitPlayer = true;
			
			SoundPlayer.playVoice();
		
		}
		
		protected function _init(e:Event):void
		{
			trace("FirstLevel._init > e : " + e);
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			
			GlobalContent.levelLoader.addEventListener(LoadLevelDesign.LOADLEVELFINISH, _onXMLLevelLoaded);
		
		}
		
		protected function _onXMLLevelLoaded(e:Event):void
		{
			GlobalContent.levelLoader.removeEventListener(LoadLevelDesign.LOADLEVELFINISH, _onXMLLevelLoaded);
			
			trace("FirstLevel._onXMLLevelLoaded > e : " + e);
			
			_bg = new Background(_textureBG);
			addChild(_bg);
			
			//PLANET
			planet = new Planet(_texture);
			planet.rotation -= Math.PI / 360 * 110;
			rotationComputation = planet.rotation;
			planet.x = 512;
			planet.y = 1200;
			addChild(planet);
			
			//CHARACTERS
			_characters = new Characters();
			_characters.x = planet.x;
			_characters.y = planet.y;
			addChild(_characters);
			
			//OndePNGGenerato
			ondeGenerator = new OndePNGCreator();
			ondeGenerator.x = planet.x;
			ondeGenerator.y = planet.y;
			addChild(ondeGenerator);
			
			_characters.addEventListener(GameEvent.GAME_OVER, _onGameOver);
			
			_feedback = new FeedBack();
			_feedback.alpha = 0;
			addChild(_feedback);
			
			//Key listener
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			Starling.current.addEventListener(OndeEvent.TOUCH_CHARACTER, _onTouchCharacter);
		}
		
		/////////////////////////////////////////////////////////////////////
		// BOUCLE PRINCIPALE
		/////////////////////////////////////////////////////////////////////
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			if (planet)
			{
				planet.rotation = rotationComputation;
			}
			
			if (dernierPassage)
			{
				if (currentNbFrame == 0)
				{
					planet.rotation -= Math.PI / 360;
				}
				else
				{
					GlobalContent.vectCharacters[0].x + 1;
					GlobalContent.vectCharacters[0].y += 6;
				}
				currentNbFrame++;
				
				if (currentNbFrame > 20 && !fixFinised)
				{
					fixFinised = true;
					TweenMax.to(this, 1, {alpha: 0, onComplete: _onGameWin});
				}
			}
			
			if (hitPlayer)
			{
				rotationComputation = planet.rotation;
				rotationComputation -= Math.PI / 360;
				
				planet.rotation = rotationComputation;
				currentNbFrame++;
				if (currentNbFrame == nbFrameAvance)
				{
					hitPlayer = false;
					currentNbFrame = 0;
				}
				
				if (rad2deg(planet.rotation) > 0 && rad2deg(planet.rotation) < 10)
				{
					planet.rotation = 0;
					Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
					Starling.current.removeEventListener(OndeEvent.TOUCH_CHARACTER, _onTouchCharacter);
					
					dernierPassage = true;
					currentNbFrame = 0;
					
				}
			}
			var collidingEnemy:AbstractEnemy;
			var characterDead:Boolean;
			
			for each (var c:AbstractChar in GlobalContent.vectCharacters)
			{
				for each (var e:AbstractEnemy in GlobalContent.enemiesVector)
				{
					if (!e.close && !c.dead)
					{
						if (e.active && c.collideWithEnemy(e))
						{
							trace("-------------------INACTIVATE BY LOOSING " + e.toString() + " " + c);
							characterDead = true;
							collidingEnemy = e;
							
						}
						
						if (!e.active && c.collideWithEnemy(e))
						{
							trace("-------------------INACTIVATE BY WINNING" + e.toString() + " " + c);
							collidingEnemy = e;
							
						}
					}
				}
			}
			
			if (collidingEnemy)
			{
				collidingEnemy.inactivate();
			}
			
			if (characterDead)
			{
				_characters.killCharacter();
			}
		}
	
	}

}