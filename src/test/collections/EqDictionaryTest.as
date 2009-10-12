package test.collections
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	import sailmate.collections.IUIDMap;
	
	public class EqDictionaryTest
	{
		private var eqDict:IUIDMap;
		
		[Before]
		public function setUp():void {
			eqDict = new IUIDMap();
		}
		
		[Test]
		public function eqEquality():void {
			var key:IEquals = k(1);
			var sameKey:IEquals = k(1);
			var otherKey:IEquals = k(2);
			
			var normalDict:Dictionary = new Dictionary();
			
			var value:Object = "VALUE";
			
			Assert.assertTrue(k(1).uid == k(1).uid);
			
			eqDict.put(key,value);
			normalDict[key] = value;
			
			assertThat(eqDict.getValue(key), equalTo(value));
			assertThat(eqDict.getValue(otherKey), equalTo(undefined));
			assertThat(eqDict.getValue(sameKey), equalTo(value));
			
			Assert.assertTrue(eqDict.containsKey(key));
			Assert.assertTrue(eqDict.containsKey(sameKey));
			Assert.assertFalse(eqDict.containsKey(otherKey));
			
			assertThat(normalDict[key], equalTo(value));
			assertThat(normalDict[otherKey], equalTo(undefined));
			assertThat(normalDict[sameKey], equalTo(undefined));
			
			Assert.assertTrue(key in normalDict);
			Assert.assertFalse(sameKey in normalDict);
			Assert.assertFalse(otherKey in normalDict);
		}
		
		[Test]
		public function forLoopWorksAsWithRealDictionary():void {
			var key1:IEquals = k(1);
			var key2:IEquals = k(2);
			eqDict.put(key1, new Object());
			eqDict.put(key2, new Object());
			var keys:ArrayCollection = new ArrayCollection();
			keys.addItem(key1);
			keys.addItem(key2);
			for ( var key:Object in eqDict ) {
				Assert.assertTrue(keys.contains(key));
				keys.removeItemAt(keys.getItemIndex(key));
			}
		}

		[Test]
		public function forEachLoopWorksAsWithRealDictionary():void {
			var key1:IEquals = k(1);
			var key2:IEquals = k(2);
			eqDict.put(key1, "A");
			eqDict.put(key2, "B");
			var values:ArrayCollection = new ArrayCollection();
			values.addItem("A");
			values.addItem("B");
			for each ( var value:String in eqDict ) {
				Assert.assertTrue(values.contains(value));
				values.removeItemAt(values.getItemIndex(value));
			}
		}
		
		//[Test]
		public function performance():void {
			var now:Number = new Date().time;
			for (var i:Number = 0; i < 20000; i++)
				eqDict.put(k(i), new Object());
			var nowAgain:Number = new Date().time;
			Alert.show("time elapsed = "+(nowAgain - now));
		}
		
		private function k(id:Number):IEquals {
			return new IEquals(id, Math.random());
		}
	}
}