package levels.levels
{
	import com.greensock.TweenMax;
	import events.GameEvent;
	import events.SceneChangeEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import levelLoader.LoadLevelDesign;
	import objects.Background;
	import objects.characters.character.AbstractChar;
	import objects.characters.Characters;
	import objects.enemies.enemy.AbstractEnemy;
	import objects.feedback.FeedBack;
	import objects.ondes.OndeEvent;
	import objects.ondes.OndePNGCreator;
	import objects.Planet;
	import sound.SoundPlayer;
	import starling.core.RenderSupport;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.rad2deg;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class AbstractLevel extends Sprite
	{
		
		private var isMoving:Boolean = false;
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
		
		private var animationFinNiveau:Boolean;
		private var fixFinised:Boolean;
		private var levelBegin:Boolean = true;
		protected var _textureBG:Texture;
		
		public function AbstractLevel()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		protected function _init(e:Event):void
		{
			trace("FirstLevel._init > e : " + e);
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			
			addEventListener(Event.REMOVED_FROM_STAGE, _onRemovedFromStage);
			GlobalContent.levelLoader.addEventListener(LoadLevelDesign.LOADLEVELFINISH, _onXMLLevelLoaded);
			
			alpha = 0.01;
		
		}
		
		protected function _onXMLLevelLoaded(e:Event):void
		{
			GlobalContent.levelLoader.removeEventListener(LoadLevelDesign.LOADLEVELFINISH, _onXMLLevelLoaded);
			
			trace("FirstLevel._onXMLLevelLoaded > e : " + e);
			//BG
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
			
			//ONDEPNGGENERATOR
			ondeGenerator = new OndePNGCreator();
			ondeGenerator.x = planet.x;
			ondeGenerator.y = planet.y;
			addChild(ondeGenerator);
			
			//Feedback
			_feedback = new FeedBack();
			_feedback.alpha = 0;
			addChild(_feedback);
			
			//Key listener
			_characters.addEventListener(GameEvent.GAME_OVER, _onGameOver);
			Starling.current.nativeStage.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			Starling.current.addEventListener(OndeEvent.TOUCH_CHARACTER, _onTouchCharacter);
		}
		
		protected function _makeText(string:String):void
		{
			var text:TextField = new TextField(200, 50, string, "Verdana", 36, 0xFFFFFF);
			text.hAlign = HAlign.LEFT;
			text.vAlign = VAlign.TOP
			
			text.alpha = 0.5;
			text.x = text.y = 10;
			addChild(text);
		}
		
		/////////////////////////////////////////////////////////////////////
		// KEYS
		/////////////////////////////////////////////////////////////////////
		private function _onKeyUp(e:KeyboardEvent):void
		{
			// BLEU
			if (e.keyCode == Keyboard.S)
			{
				
				_feedback.activate(GlobalContent.BLEU);
				if (GlobalContent.currentOnde != null && !GlobalContent.currentOnde.playerHit && GlobalContent.currentOnde.color == "yellow" && GlobalContent.currentOnde.stateLigne == 1)
				{
					GlobalContent.currentOnde.playerHit = true;
					_moveForward();
				}
			}
			
			// BLANCHE
			if (e.keyCode == Keyboard.L)
			{
				
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
			
			isMoving = true;
			
			SoundPlayer.playVoice();
		
		}
		
		private function _onTouchCharacter(e:OndeEvent):void
		{
			SoundPlayer.playBattementComplet();
		
		}
		
		/////////////////////////////////////////////////////////////////////
		// BOUCLE PRINCIPALE
		/////////////////////////////////////////////////////////////////////
		override public function render(support:RenderSupport, parentAlpha:Number):void
		{
			super.render(support, parentAlpha);
			
			if (levelBegin)
			{
				alpha += 0.01;
				if (alpha == 1)
				{
					levelBegin = false;
				}
			}
			else
			{
				_detectionFinNiveau();
				_mouvement();
				_detectionCollision();
			}
		
		}
		
		private function _mouvement():void
		{
			if (isMoving)
			{
				_characters.startAnimation();
				rotationComputation = planet.rotation;
				rotationComputation -= Math.PI / 360;
				
				planet.rotation = rotationComputation;
				currentNbFrame++;
				
				if (rad2deg(planet.rotation) > 0 && rad2deg(planet.rotation) < 10)
				{
					planet.rotation = 0;
					Starling.current.nativeStage.removeEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
					Starling.current.removeEventListener(OndeEvent.TOUCH_CHARACTER, _onTouchCharacter);
					
					animationFinNiveau = true;
					currentNbFrame = 0;
					
				}
				
				if (currentNbFrame == nbFrameAvance)
				{
					isMoving = false;
					_characters.stopAnimation();
					currentNbFrame = 0;
				}
			}
		}
		
		private function _detectionFinNiveau():void
		{
			//FIN DU NIVEAU
			if (animationFinNiveau)
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
					Starling.juggler.tween(this, 1, {alpha: 0, onComplete: _onGameWin});
				}
			}
		}
		
		private function _detectionCollision():void
		{
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
				GlobalContent.FXshake(this, _characters.killCharacter);
				
			}
		}
		
		/////////////////////////////////////////////////////////////////////
		// GAME OVER
		/////////////////////////////////////////////////////////////////////
		private function _onGameOver(e:GameEvent = null):void
		{
			trace("Game._onGameOver > e : " + e);
			
			TweenMax.to(this, 0.5, {alpha: 0, onComplete: _onFinishHideGameOver})
		
		}
		
		private function _onFinishHideGameOver():void
		{
			var event:SceneChangeEvent = new SceneChangeEvent(SceneChangeEvent.CHANGE);
			event.nextSceneName = GlobalContent.SCREEN_LOSE;
			dispatchEvent(event);
		}
		
		/////////////////////////////////////////////////////////////////////
		// GAME WIN
		/////////////////////////////////////////////////////////////////////
		private function _onGameWin(e:GameEvent = null):void
		{
			trace("Game._onGameOver > e : " + e);
			
			TweenMax.to(this, 0.5, {alpha: 0, onComplete: _onFinishHide})
		
		}
		
		protected function _onFinishHide():void
		{
		
		}
		
		/////////////////////////////////////////////////////////////////////
		// REMOVED FROM STAGE
		/////////////////////////////////////////////////////////////////////
		
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
	
	}

}