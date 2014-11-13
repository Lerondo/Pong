package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import src.Game.Opponent;
	import src.Game.Player01;
	
	/**
	 * ...
	 * @author Alessandro
	 */
	public class Main extends MovieClip 
	{	
		var _background : Background;
		
		public function Main():void
		{
			_background = new Background;
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		function init():void
		{
			var _player : Player01 = new Player01();
			var _opponent : Opponent = new Opponent();
			addChild(_background);
			addChild(_player);
			addChild(_opponent);
			BackgroundFullScreen();
		}
		
		function BackgroundFullScreen() 
		{
			_background.x = 1005 - stage.width / 2;
			_background.y = 600 - stage.height / 2;
			_background.width = stage.stageWidth;
			_background.height = stage.stageHeight;
		} 
	}
}