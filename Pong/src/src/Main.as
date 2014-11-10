package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Alessandro
	 */
	public class Main extends MovieClip 
	{
		public var playerPaddle : Paddle;
		public var cpuPaddle : Paddle;
		public var ball : Ball;
		
		public var ballspeedX : int = -3;
		public var ballspeedY : int = -2;
		public var cpuPaddleSpeed : int = 3;
		public var playerScore : int = 0;
		public var cpuScore : int = 0;
		
		public function Main():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		function init():void
		{
			playerPaddle = new Paddle;
			cpuPaddle = new Paddle;
			ball = new Ball;
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			addChild(playerPaddle);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function calculateBallAngle(paddleY:Number, ballY:Number):Number
		{
			var ySpeed : Number = 5 * ( (ballY-paddleY) / 25 );
			return ySpeed;
		}
		
		function loop(e:Event):void
		{
			if ( playerPaddle.hitTestObject(ball) == true )
			{
				if (ballSpeedX < 0)
				{
					ballspeedX *= -1;
					ballSpeedY = calculateBallAngle(playerPaddle.y, ball.y);
				}
			} else if ( cpuPaddle.hitTestObject(ball) == true)
			{
				if ( ballspeedX > 0)
				{
					ballspeedX *= -1;
					ballSpeedY = calculateBallAngle(cpuPaddle.y, ball.y);
				}
			}
			playerPaddle.y = mouseY;
			
			ball.x += ballSpeedX;
			ball.y += ballSpeedY;
			
			if (playerPaddle.y - playerPaddle.height / 2 < 0)
			{
				playerPaddle.y = playerPaddle.height / 2;
			} else if (playerPaddle.y + playerPaddle.height / 2 > stage.stageHeight)
			{
				playerPaddle.y = stage.stageHeight - playerPaddle.height / 2;
			}
			
			if (ball.x <= ball.width / 2)
			{
				ball.x = stage.stageWidth / 2;
				ballspeedX *= -1;
			}else if(ball.x >= stage.stageWidth - ball.width/2)
			{
				ball.x = stage.stageWidth - ball.width / 2;
				ballspeedX *= -1;
				playerScore++;
			}
			if (ball.y <= ball.height / 2)
			{
				ball.y = ball.height/2;
				ballSpeedY *= -1;
			} else if (ball.y >= stage.stageHeight - ball.height / 2)
			{
				ball.y = stage.stageHeight-ball.height/2;
				ballSpeedY *= -1;
			}
			
			if (playerPaddle.y - playerPaddle.height / 2 < 0)
			{
				playerPaddle.y = playerPaddle.height / 2;
			} else if (playerPaddle.y + playerPaddle.height / 2 > stage.stageHeight)
			{
				playerPaddle.y = stage.stageHeight - playerPaddle.height / 2;
			}
		}
	}
}