package test.collections
{
	import mx.core.IUID;
	
	public class IEquals implements IUID
	{
		private var id:Number;
		
		public function IEquals(id:Number)
		{
			this.id = id;
		}
		
		public function set uid(value:String):void {}
		public function get uid():String { return "EQOBJECT:"+id }
		
	}
}