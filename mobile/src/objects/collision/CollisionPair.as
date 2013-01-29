package objects.collision 
{
	import objects.characters.AbstractChar;
	import objects.enemy.AbstractEnemy;
	/**
	 * ...
	 * @author ld
	 */
	public class CollisionPair 
	{
	private var _enemy:AbstractEnemy;
	private var _character:AbstractChar;
		
		public function CollisionPair(enemy1:AbstractEnemy, char1:AbstractChar) 
		{
			_enemy = enemy1;
			_character = char1;
		}
		
		public function get enemy():AbstractEnemy 
		{
			return _enemy;
		}
		
		public function set enemy(value:AbstractEnemy):void 
		{
			_enemy = value;
		}
		
		public function get character():AbstractChar 
		{
			return _character;
		}
		
		public function set character(value:AbstractChar):void 
		{
			_character = value;
		}
	}

}