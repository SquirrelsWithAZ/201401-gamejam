package
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import actors.Demon;
	import actors.Tree;
	
	import camera.Camera;
	
	import ui.LockCameraButton;
	
	public class Main extends Sprite
	{
		private var scene:Sprite;
		private var camera:Camera;
		
		private var lastTime:int;
		
		public function Main()
		{
			// Debugging -- only when running in debug.
			trace("Hello world");
			
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//              V FULL SCREEN V
			this.stage.fullScreenSourceRect = new Rectangle(0,0,stage.fullScreenWidth,stage.fullScreenHeight);
			this.stage.nativeWindow.maximize();
			this.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			//              ^ FULL SCREEN ^
			
			const tree:Tree = new Tree();
			const daemon:Demon = new Demon();
			daemon.x = -50;
			daemon.y = -25;
						
			this.scene = new Sprite();
			{
				// Display container properties
				scene.x = this.stage.stageWidth/2;
				scene.y = this.stage.stageHeight/2;
				
				// scene container contents
				this.scene.addChild(daemon);
				this.scene.addChild(tree);
			}
			
			// Camera
			this.camera = new Camera(this.scene);
			this.camera.enableClickAndDrag(this.scene);
			this.camera.disableClickAndDrag();
			
			// Stage
			this.addChild(this.camera);
			
			// UI
			this.camera.addChild(new LockCameraButton(this.stage, this.camera));
			
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			//trace("tick...");
			
/*			this.scene.x += 1.0;
			this.scene.y += 1.0;*/
			
		
			var currentTime:int = getTimer();
			var dt:Number = currentTime - this.lastTime 
			
			this.camera.update(dt);
			
			this.lastTime = currentTime;
		}
	}
}