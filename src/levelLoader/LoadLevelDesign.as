package levelLoader
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.XMLLoader;
	import objects.enemy.AbstractEnemy;
	import objects.enemy.EnemyFire;
	import objects.enemy.EnemyGhost;
	import objects.enemy.EnemySand;
	import objects.ondes.OndePNG;
	import starling.events.Event;
	import starling.events.EventDispatcher;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LoadLevelDesign extends EventDispatcher
	{
		private var levelObject:XMLList;
		public var myXMLFile:XML;
		public var xmlLoader:XMLLoader;
		
		public var currentLevelId:int;
		public var currentLevel:XMLList;
		public var currentWaveId:int;
		public var currentWave:OndePNG;
		
		static public const LOADXMLFINISH:String = "loadxmlfinish";
		static public const LOADLEVELFINISH:String = "loadlevelfinish";
		
		public function LoadLevelDesign()
		{
			//currentLevelId = idLevel;
			xmlLoader = new XMLLoader("xml/game.xml", {onComplete: xmlLoaded});
			xmlLoader.load();
		
		}
		
		public function xmlLoaded(e:LoaderEvent):void
		{
			trace( "LoadLevelDesign.xmlLoaded > e : " + e );
			myXMLFile = new XML((e.currentTarget as XMLLoader).content);
			GlobalContent.mainXML = myXMLFile;
			
			//loadLevel(1);
			
			this.dispatchEvent(new Event(LoadLevelDesign.LOADXMLFINISH));
		
		}
		
		public function loadLevel(id_:int):void
		{
			GlobalContent.currentWaveId = 0;
			levelObject = myXMLFile..level.(@id == id_).children();
			
			GlobalContent.ondesVector = new Vector.<OndePNG>;
			GlobalContent.enemiesVector = new Vector.<AbstractEnemy>;
			
			var onde:OndePNG;
			var enemy:AbstractEnemy;
			
			for each (var obj:XML in levelObject)
			{
				if (obj.name() == "wave")
				{
					onde = new OndePNG(int(obj.attribute("id")), int(obj.attribute("time")), int(obj.attribute("speed")), String(obj.attribute("color")), String(obj.attribute("sound")));
					GlobalContent.ondesVector.push(onde);
				}
				
				if (obj.name() == "obstacle")
				{
					if (obj.attribute("type") == 1)
					{
						enemy = new EnemyFire(obj.attribute("id"), obj.attribute("type"), obj.attribute("position"));
						GlobalContent.enemiesVector.push(enemy);
					}
					else if (obj.attribute("type") == 2)
					{
						enemy = new EnemyGhost(obj.attribute("id"), obj.attribute("type"), obj.attribute("position"));
						GlobalContent.enemiesVector.push(enemy);
						
					}else if (obj.attribute("type") == 3)
					{
						enemy = new EnemySand(obj.attribute("id"), obj.attribute("type"), obj.attribute("position"));
						GlobalContent.enemiesVector.push(enemy);
					}
					
				}
				
			}
			
			dispatchEvent(new Event(LoadLevelDesign.LOADLEVELFINISH));
		
		}
		
		public function getOndes():void
		{
		
		}
		
		/////////////////////////////////////////////////////////////////////
		// UTILS
		/////////////////////////////////////////////////////////////////////
		public function showLoaded():void
		{
			
			for each (var o:OndePNG in GlobalContent.ondesVector)
			{
				trace(o.toString());
			}
			
			for each (var g:AbstractEnemy in GlobalContent.enemiesVector)
			{
				trace(g.toString());
			}
		}
	
	}

}