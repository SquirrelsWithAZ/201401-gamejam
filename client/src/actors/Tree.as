package actors
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class Tree extends Sprite
	{
		[Embed(source="../../bin/swf/prop.swf", symbol="tree_group2")]
		private var clipClass:Class;
		
		private var clip:DisplayObject;
		
		public function Tree()
		{
			this.clip = new this.clipClass();
			this.addChild(this.clip);
		}
	}
}