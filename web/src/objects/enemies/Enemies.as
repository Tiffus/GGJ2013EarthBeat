package objects.enemies
{
	import objects.enemies.enemy.AbstractEnemy;
	import objects.enemies.enemy.EnemyFire;
	import objects.enemies.enemy.EnemyGhost;
	import objects.enemies.enemy.EnemySand;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.deg2rad;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Enemies extends Sprite
	{
		public function Enemies()
		{
			addEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
		}
		
		private function _onAddedToStage(e:Event):void
		{
			
			this.rotation = deg2rad(-10);
			
			removeEventListener(Event.ADDED_TO_STAGE, _onAddedToStage);
			
			for each (var enemy:AbstractEnemy in GlobalContent.enemiesVector)
			{
				
				if (enemy.type == 1)
				{
					var myEnemy:EnemyFire = EnemyFire(enemy);
					myEnemy.init();
					myEnemy.rotation += deg2rad(myEnemy.position);
					addChild(myEnemy);
					trace(myEnemy.toString);
				} else if (enemy.type == 2) {
					var myEnemy2:EnemyGhost = EnemyGhost(enemy);
					myEnemy2.init();
					myEnemy2.rotation += deg2rad(myEnemy2.position);
					addChild(myEnemy2);
					trace(myEnemy2.toString);
				} else if (enemy.type == 3) {
					var myEnemy3:EnemySand = EnemySand(enemy);
					myEnemy3.init();
					myEnemy3.rotation += deg2rad(myEnemy3.position);
					addChild(myEnemy3);
					trace(myEnemy3.toString);
				}
				
			}
		
		}
		
	
	/*		public function changeColor(color:String):void
	   {
	   for each (var c:AbstractEnemy in vectChar)
	   {
	   c.changeColor(color);
	   }
	 }*/
	
	}

}