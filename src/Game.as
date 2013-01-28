package
{
	import events.SceneChangeEvent;
	import levelLoader.LoadLevelDesign;
	import levels.Credits;
	import levels.FirstLevel;
	import levels.Intro;
	import levels.LastLevel;
	import levels.Lose;
	import levels.SecondLevel;
	import levels.ThirdLevel;
	import levels.Tuto;
	import levels.Win;
	import sound.SoundPlayer;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Tiffus mailto : el.tiffus@gmail.com
	 */
	public class Game extends Sprite
	{
		private var _actualScene:Sprite;
		private var _nextScene:Sprite;
		private var _nextSceneName:String
		private var _stageContainer:Sprite;
		
		public function Game()
		{
			
			init();
		}
		
		private function init():void
		{
			
			GlobalContent.game = this;
			_nextSceneName = GlobalContent.DEFAULT_SCREEN;
			
			//Load level
			GlobalContent.levelLoader = new LoadLevelDesign();
			GlobalContent.levelLoader.addEventListener(LoadLevelDesign.LOADXMLFINISH, _onXMLLoaded);
		
		}
		
		private function _onXMLLoaded(e:Event):void
		{
			GlobalContent.levelLoader.removeEventListener(LoadLevelDesign.LOADLEVELFINISH, _onXMLLoaded);
			_changeScene();
		}
		
		private function _changeScene(e:SceneChangeEvent = null):void
		{
			//Récupération du xml du niveau en fonction GlobalContent.actualLevel
			//GlobalContent.actualXML = GlobalContent.mainXML.stage.(@id == GlobalContent.actualLevel)[0];
			GlobalContent.isShaking = false;
			
			if (_actualScene)
			{
				_actualScene.removeEventListener(SceneChangeEvent.CHANGE, _changeScene);
				_nextSceneName = e.nextSceneName;
			}
			
			trace("Changement de scene demandé : " + _nextSceneName);
			
			trace("_nextSceneName : " + _nextSceneName);
			switch (_nextSceneName)
			{
				case GlobalContent.SCREEN_TITLE: 
					_nextScene = new Intro();
					SoundPlayer.stopAmbiance();
					break;
				case GlobalContent.SCREEN_TUTO: 
					_nextScene = new Tuto();
					SoundPlayer.stopAmbiance();
					break;
					
				case GlobalContent.SCREEN_MAIN: 
					_nextScene = new FirstLevel();
					SoundPlayer.setLevel(0);
					break;
				case GlobalContent.SCREEN_SECOND: 
					_nextScene = new SecondLevel();
					SoundPlayer.setLevel(1);
					break;
				case GlobalContent.SCREEN_THIRD: 
					_nextScene = new ThirdLevel();
					SoundPlayer.setLevel(2);
					break;
				case GlobalContent.SCREEN_FINAL: 
					_nextScene = new LastLevel();
					SoundPlayer.setLevel(3);
					break;
					
				case GlobalContent.SCREEN_WIN: 
					_nextScene = new Win();
					SoundPlayer.stopAmbiance();
					break;
				case GlobalContent.SCREEN_LOSE: 
					_nextScene = new Lose();
					SoundPlayer.stopAmbiance();
					break;
				
				case GlobalContent.SCREEN_CREDIT: 
					_nextScene = new Credits();
					break;
				
				default: 
					_nextScene = new Intro();
					SoundPlayer.stopAmbiance();
			}
			
			_finishChangeScene();
		}
		
		private function _finishChangeScene():void
		{
			trace("Game._finishChangeScene");
			if (_actualScene)
			{
				removeChild(_actualScene);
				_actualScene = null;
			}
			
			_actualScene = _nextScene;
			addChild(_actualScene);
			
			_nextScene = null;
			
			_actualScene.addEventListener(SceneChangeEvent.CHANGE, _changeScene);
		
		}
	
	}

}