package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class GameEvent extends Event
	{
		static public const GAME_OVER:String = "gameOver";
		
		public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		
		}
		
		
	
	}

}