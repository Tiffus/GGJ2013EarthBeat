package objects.ondes
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class OndePNGCreator extends Sprite
	{
		private var maxWave:int;
		private var nextWave:OndePNG;
		private var initialized:Boolean;
		
		public function OndePNGCreator()
		{
			_init();
		}
		
		public function destroy():void
		{
			for each (var o:OndePNG in GlobalContent.ondesVector)
			{
				o.destroy();
				if (nextWave.hasEventListener(OndeEvent.LAST_ONE_DESTROYED))
				{
					nextWave.removeEventListener(OndeEvent.LAST_ONE_DESTROYED, _onLastDestroyed);
				}
			}
		}
		
		private function _init():void
		{
			trace("OndePNGCreator._init");
			
			maxWave = 0;
			
			for each (var o:OndePNG in GlobalContent.ondesVector)
			{
				nextWave = o;
				if (!initialized)
				{
					addChild(nextWave);
				}
				nextWave.animate();
				maxWave++;
			}
			initialized = true;
			nextWave.lastOneOfThePattern = true;
			nextWave.addEventListener(OndeEvent.LAST_ONE_DESTROYED, _onLastDestroyed);
		
		}
		
		private function _onLastDestroyed(e:OndeEvent):void
		{
			trace("OndePNGCreator._onLastDestroyed > e : " + e);
			nextWave.lastOneOfThePattern = false;
			if (nextWave.hasEventListener(OndeEvent.LAST_ONE_DESTROYED))
			{
				nextWave.removeEventListener(OndeEvent.LAST_ONE_DESTROYED, _onLastDestroyed);
			}
			
			for each (var o:OndePNG in GlobalContent.ondesVector)
			{
				o.reinit();
				o.playerHit = false;
			}
			
			_init();
		}
	
	}

}