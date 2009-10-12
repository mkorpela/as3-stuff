package test.collections
{
	import mx.collections.ArrayCollection;
	import mx.core.IUID;
	
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	import sailmate.collections.IUIDSet;
	
	public class IUIDSetTest
	{
		private var iuidSet:IUIDSet;
		
		[Before]
		public function setUp():void {
			iuidSet = new IUIDSet();
		}
		
		[Test]
		public function canContainOnlyOneWithSameIUID():void {
			var item1:IUID = item(1);
			iuidSet.add(item1);
			var item2:IUID = item(1);
			iuidSet.add(item2);
			assertThat(iuidSet.size(), equalTo(1));
		}
		
		[Test]
		public function canContainMoreThanOneItemWithDifferingIUIDs():void {
			var amount:Number = 10;
			for(var i:Number = 0; i < amount; i++){
				iuidSet.add(item(i));
			}
			assertThat(iuidSet.size(), equalTo(amount));
		}
		
		[Test]
		public function containsWorksWithIUID():void {
			var item1:IUID = item(1);
			var item2:IUID = item(2);
			var item3:IUID = item(3);
			var item1Again:IUID = item(1);
			iuidSet.add(item1);
			iuidSet.add(item2);
			Assert.assertTrue(iuidSet.contains(item1Again));
			Assert.assertTrue(iuidSet.contains(item2));
			Assert.assertFalse(iuidSet.contains(item3));
		}
		
		[Test]
		public function itemsCanBeRemoved():void {
			var amount:Number = 10;
			for(var i:Number; i < amount; i++){
				iuidSet.add(item(i));
			}
			for(var j:Number; i < amount; i++){
				Assert.assertTrue(iuidSet.contains(item(j)));
				iuidSet.remove(item(j));
				assertThat(iuidSet.size(), equalTo(amount - i));
				Assert.assertFalse(iuidSet.contains(item(j)));
			}
		}
		
		[Test]
		public function forEachWorks():void {
			var amount:Number = 10;
			var items:ArrayCollection = new ArrayCollection();
			for(var i:Number; i < amount; i++){
				iuidSet.add(item(i));
				items.addItem(item(i));
			}
			for each(var it:IUID in iuidSet){
				Assert.assertTrue(items.contains(it));
				items.removeItemAt(items.getItemIndex(it));
			}
			Assert.assertTrue(items.length == 0);
		}
		
		private function item(id:Number):IUID {
			return new IEquals(id, -id);
		}
	}
}