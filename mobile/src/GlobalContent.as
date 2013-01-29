package
{
	import com.greensock.easing.RoughEase;
	import com.greensock.TweenMax;
	import levelLoader.LoadLevelDesign;
	import objects.characters.character.AbstractChar;
	import objects.enemies.enemy.AbstractEnemy;
	import objects.ondes.OndePNG;
	import starling.display.DisplayObject;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class GlobalContent
	{
		static public const BLANC:String = "red";
		static public const BLEU:String = "yellow";
		static public const BLACK:String = "black";
		static public const DEFAULT_SCREEN:String = SCREEN_TITLE;
		static public const SCREEN_TITLE:String = "screenTitle";
		static public const SCREEN_MAIN:String = "screenMain";
		static public const SCREEN_TUTO:String = "screenTuto";
		static public const SCREEN_FINAL:String = "screenFinal";
		static public const SCREEN_WIN:String = "screenWin";
		static public const SCREEN_CREDIT:String = "screenCredit";
		static public const SCREEN_LOSE:String = "screenLose";
		static public const SCREEN_SECOND:String = "screenSecond";
		static public const SCREEN_THIRD:String = "screenThird";
		
		static public var BLEU_VALUE:uint = 0x365EB9;
		static public var BLANC_VALUE:uint = 0xFFFFFF;
		static public var BLACK_VALUE:uint = 0x000000;
		
		static public var RAYON_MAX_WAVE:int = 1069;
		
		static public var currentLevelId:Number;
		static public var currentWaveId:Number;
		
		static public var levelLoader:LoadLevelDesign;
		
		static public var ondesVector:Vector.<OndePNG>;
		static public var enemiesVector:Vector.<AbstractEnemy>;
		
		static public var ondesVectorL1:Vector.<OndePNG> = new Vector.<OndePNG>;
		static public var enemiesVectorL1:Vector.<AbstractEnemy> = new Vector.<AbstractEnemy>;
		
		static public var characterColor:String;
		static public var ondeColor:String;
		
		static public var vectCharacters:Vector.<AbstractChar>;
		
		static public var game:Game;
		
		static public var mainXML:XML;
		static public var actualXML:XML;
		
		static public var isShaking:Boolean;
		
		static public var currentOnde:OndePNG;
		static public var fullScreenWidth:int;
		
		public function GlobalContent()
		{
		
		}
		
		/////////////////////////////////////////////////////////////////////
		// FX
		/////////////////////////////////////////////////////////////////////
		
		static public function FXshake(item:DisplayObject, callback:Function = null):void
		{
			if (!isShaking)
			{
				isShaking = true;
				
				var originalX:int = item.x;
				var originalY:int = item.y;
				
				TweenMax.to(item, 0.3, {y: originalY + 1, x: originalX + 1, ease: RoughEase.create(100), onComplete: function():void
					{
						item.x = originalX;
						item.y = originalY;
						
						isShaking = false;
						
						if (callback != null)
						{
							callback();
						}
					}});
			}
		}
	
	}

}