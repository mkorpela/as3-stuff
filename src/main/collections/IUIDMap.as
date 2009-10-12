package sailmate.collections
{
	import flash.utils.Dictionary;
	
	import mx.core.IUID;
	
	public class IUIDMap extends Dictionary
	{
		private var iuidDict:Dictionary = new Dictionary();
		
		public function put(key:IUID, value:*):void {
			if(iuidDict[key.uid] !== undefined){
				var oldKey:* = iuidDict[key.uid]
				if(oldKey !== key) delete this[oldKey]
			}
			this[key] = value;
			iuidDict[key.uid] = key;
		}
		
		public function getValue(key:IUID):* {
			if(iuidDict[key.uid] === undefined) return undefined;
			return this[iuidDict[key.uid]];
		}
		
		public function remove(key:IUID):void {
			if(iuidDict[key.uid] === undefined) return;
			delete this[iuidDict[key.uid]];
			delete iuidDict[key.uid];
		}
		
		public function containsKey(key:IUID):Boolean {
			return key.uid in iuidDict;
		}
	}
}