(function ($global) { "use strict";
class Test {
	static main() {
		console.log("Test.hx:3:","Hello World !");
	}
}
class haxe_iterators_ArrayIterator {
	constructor(array) {
		this.current = 0;
		this.array = array;
	}
	hasNext() {
		return this.current < this.array.length;
	}
	next() {
		return this.array[this.current++];
	}
}
{
}
Test.main();
})({});
