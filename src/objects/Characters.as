package objects
{
	import com.greensock.TweenMax;
	import events.GameEvent;
	import objects.characters.AbstractChar;
	import objects.characters.Char1;
	import objects.characters.Char2;
	import objects.characters.Char3;
	import objects.characters.Char4;
	import objects.characters.Char5;
	import objects.characters.Char6;
	import sound.SoundPlayer;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Characters extends Sprite
	{
		private var mom:AbstractChar;
		private var dad:AbstractChar;
		private var daughter:AbstractChar;
		private var son:AbstractChar;
		private var grandpa:AbstractChar;
		private var grandma:AbstractChar;
		private var decalage:int;
		static private const DEFAULT_DECALAGE_CHARACTERS:Number = 3;
		
		private var charactersNumber:int = 6;
		private var isKilling:Boolean;
		private var fond:Quad;
		private var areMoving:Boolean;
		private var _vectChar:Vector.<AbstractChar>;
		
		public function Characters()
		{
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		}
		
		private function _onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			//CHARACTERS
			mom = new Char1();
			dad = new Char2();
			daughter = new Char3();
			son = new Char4();
			grandpa = new Char5();
			grandma = new Char6();
			
			//VECTEUR CHARACTERS
			_vectChar = new Vector.<AbstractChar>;
			_vectChar.push(mom, dad, daughter, son, grandpa, grandma);
			_vectChar.fixed = true;
			
			GlobalContent.vectCharacters = _vectChar;
			
			//PLACEMENT
			decalage = 0;
			
			for each (var c:AbstractChar in _vectChar)
			{
				c.rotation -= deg2rad(decalage);
				decalage += DEFAULT_DECALAGE_CHARACTERS;
				
				addChild(c);
			}
			
			this.rotation = deg2rad(-10);
		
		}
		
		/**
		 * Lorsque le groupe est touché on tue un des personnage en partant de la fin
		 */
		public function killCharacter():void
		{
			
			if (!isKilling)
			{
				isKilling = true;
				charactersNumber > 0 ? charactersNumber-- : charactersNumber = 0;
				
				TweenMax.to(_vectChar[charactersNumber].container, 2, {rotation: 3, alpha: 0, onComplete: function():void
					{
						GlobalContent.vectCharacters[charactersNumber].dead = true;
						
						switch (charactersNumber)
						{
							case 0: 
								SoundPlayer.playVoiceMom();
								break;
							case 1: 
								SoundPlayer.playVoiceDad();
								
								break;
							case 2: 
								SoundPlayer.playVoiceGirl();
								
								break;
							case 3: 
								SoundPlayer.playVoiceBoy();
								
								break;
							case 4: 
								SoundPlayer.playVoiceGranMa();
								
								break;
							case 5: 
								SoundPlayer.playVoiceGranPa();
								
								break;
							
							default: 
						}
						
						isKilling = false;
					}});
				
				if (charactersNumber == 0)
				{
					//gameOver
					dispatchEvent(new GameEvent(GameEvent.GAME_OVER));
				}
			}
		
		}
		
		public function startAnimation():void
		{
			if (!areMoving)
			{
				areMoving = true;
				
				for each (var c:AbstractChar in _vectChar)
				{
					c.startAnimation();
				}
			}
		}
		
		public function stopAnimation():void
		{
			if (areMoving)
			{
				areMoving = false;
				
				for each (var c:AbstractChar in _vectChar)
				{
					c.stopAnimation();
				}
			}
		}
		
		public function get vectChar():Vector.<AbstractChar>
		{
			return _vectChar;
		}
		
		public function set vectChar(value:Vector.<AbstractChar>):void
		{
			_vectChar = value;
		}
	
	}

}