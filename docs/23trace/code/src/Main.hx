package;

class Main {
	function new() {
		trace('this is the default trace');
		// now we are going to overwrite the default trace with our own
		haxe.Log.trace = function(v:Dynamic, ?infos:haxe.PosInfos) {
			var str = "→ \"" + v + "\" → " + infos.fileName + ":" + infos.lineNumber;
			Sys.println(str);
		}
		init();
	}

	function init() {
		Sys.println('this is the default sys.println');
		// logging via Haxe
		trace("this is the new (default) trace");
	}

	static public function main() {
		var main = new Main();
	}
}
