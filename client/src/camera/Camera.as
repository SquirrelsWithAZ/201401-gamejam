package camera
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;

	public class Camera extends MovieClip
	{
		private var target:DisplayObjectContainer;
		private var clickAndDragZone:DisplayObject;
		
		private var px:Number;
		private var py:Number;
		
		public function Camera(target:DisplayObjectContainer)
		{
			this.target = target;
			
			addChild(target);
		}
		
		public function enableClickAndDrag(clickAndDragZone:DisplayObject):void
		{
			if(this.clickAndDragZone == null)
			{
				this.clickAndDragZone = clickAndDragZone;
				this.clickAndDragZone.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				this.clickAndDragZone.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			}
			else
			{
				throw new Error("Click and drag already enabled. Disable first.");
			}
		}
		
		public function disableClickAndDrag():void
		{
			this.clickAndDragZone.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.clickAndDragZone.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.clickAndDragZone.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			
			this.clickAndDragZone = null;
		}
		
		public function isClickAndDragEnabled():Boolean
		{
			return this.clickAndDragZone != null;
		}
		
		public function viewWidth():int
		{
			return this.stage.stageWidth;
		}
		
		public function viewHeight():int
		{
			return this.stage.stageHeight;
		}
		
		public function update(dt:Number):void
		{
			
		}
		
		private function onMouseDown(event:Event):void
		{
			this.clickAndDragZone
			this.clickAndDragZone.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			
			this.px = this.stage.mouseX;
			this.py = this.stage.mouseY;
		}
		
		private function onMouseUp(event:Event):void
		{
			this.clickAndDragZone.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function onMouseMove(event:Event):void
		{
			var mouseEvent:MouseEvent = event as MouseEvent;
			
			// mouseEvent.STAGE
			//trace("x: " + mouseEvent.stageX.toFixed(2) + "  \ty: " + mouseEvent.stageY.toFixed(2));
			
			// mouseEvent.LOCAL
			//trace("x: " + mouseEvent.localX.toFixed(2) + "  \ty: " + mouseEvent.localY.toFixed(2));
			
			this.target.x += this.stage.mouseX - this.px;
			this.target.y += this.stage.mouseY - this.py;
			
			this.px = this.stage.mouseX;
			this.py = this.stage.mouseY;
		}
	}
}