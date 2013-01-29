package events
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class SceneChangeEvent extends Event
	{
		static public const CHANGE:String = "change";
		
		private var _nextSceneName:String;
		
		public function SceneChangeEvent(type:String, bubbles:Boolean = false)
		{
			super(type, bubbles);
		
		}
		
		/////////////////////////////////////////////////////////////////////
		// GETTER/SETTER
		/////////////////////////////////////////////////////////////////////
		
		public function get nextSceneName():String
		{
			return _nextSceneName;
		}
		
		public function set nextSceneName(value:String):void
		{
			_nextSceneName = value;
		}
	
	}

}