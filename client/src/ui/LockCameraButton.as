package ui
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import camera.Camera;

	public class LockCameraButton extends Sprite
	{
		private var stage:Stage;
		private var camera:Camera;
		
		private var buttonSprite:Sprite;
		private var buttonText:TextField;
		
		public function LockCameraButton(stage:Stage, camera:Camera) 
		{
			this.stage = stage;
			this.camera = camera;
			
			var button:SimpleButton = new SimpleButton();
			
			this.buttonSprite = new Sprite();
			this.buttonSprite.graphics.lineStyle(1, 0x555555);
			this.buttonSprite.graphics.beginFill(0xFFFF00, 0.25);
			this.buttonSprite.graphics.drawRect(0,0,this.camera.viewWidth()-1,30);
			this.buttonSprite.graphics.endFill();
			
			this.buttonText = new TextField();
			this.buttonText.width = this.buttonSprite.width;
			this.buttonText.height = this.buttonSprite.height;
			
			refreshUi();
			
			buttonSprite.addChild(this.buttonText);
			button.upState = button.downState = button.overState = button.hitTestState = buttonSprite;
			button.addEventListener(MouseEvent.CLICK, onPress);
			
			this.addChild(button);
			
			
			this.stage.addEventListener(Event.RESIZE, onResize);
		}
		
		private function onPress(event:Event):void
		{
			if(this.camera.isClickAndDragEnabled())
			{
				this.camera.disableClickAndDrag();
			}
			else
			{
				this.camera.enableClickAndDrag(this.stage);
			}
			
			refreshUi();
		}
		
		private function onResize(event:Event):void
		{
			refreshUi();
		}
		
		private function refreshUi():void
		{
			if(this.camera.isClickAndDragEnabled())
			{
				this.buttonText.text = "Lock Camera";
			}
			else
			{
				this.buttonText.text = "Unlock Camera";
			}
			
			var buttonTextFormat:TextFormat = new TextFormat();
			buttonTextFormat.align = TextFormatAlign.CENTER;
			this.buttonText.setTextFormat(buttonTextFormat);
			
			this.buttonSprite.width = this.camera.viewWidth();
		}
	}
}