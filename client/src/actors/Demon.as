package actors
{
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class Demon extends Sprite
	{
		// The Definition of the Demon
		[Embed(source="../../bin/swf/mob.swf", symbol="deamon")]
		private const clipClass:Class;
		
		// The Demon!
		private var clip:MovieClip;
		
		public function Demon()  
		{
			clip = new this.clipClass();
			this.addChild(clip);
		}
	}
}