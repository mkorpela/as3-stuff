package sailmate.collections
{
	import flash.utils.Dictionary;
	
	import mx.core.IUID;

	dynamic public class IUIDSet extends Dictionary
	{
		private var length:Number = 0; 
		
		public function add(item:IUID):void {
			if(this[item.uid] === undefined) length++;
			this[item.uid] = item;
		}
		
		public function size():Number {
			return length;
		}
		
		public function contains(item:IUID):Boolean {
			return this[item.uid] !== undefined;
		}
		
		public function remove(item:IUID):void {
			if(this[item.uid] !== undefined){
				delete this[item.uid];
				length--;
			}
		}
	}
}