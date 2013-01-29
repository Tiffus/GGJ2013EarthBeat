package objects.ondes
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class OndeEvent extends Event
	{
		static public const DESTROY:String = "destroy";
		static public const TOUCH_CHARACTER:String = "touchCharacter";
		static public const DONT_TOUCH_CHARACTER:String = "dontTouchCharacter";
		static public const LAST_ONE_DESTROYED:String = "lastOneDestroyed";
		private var _color:String;
		
		public function OndeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		
		}
		
		public function get color():String
		{
			return _color;
		}
		
		public function set color(value:String):void
		{
			_color = value;
		}
	
	}

}