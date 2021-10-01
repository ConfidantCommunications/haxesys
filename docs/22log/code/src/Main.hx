package;

import Logger.*;

// https://en.wikipedia.org/wiki/ANSI_escape_code
// https://github.com/haxiomic/console.hx/blob/master/Console.hx
// https://stackoverflow.com/questions/5762491/how-to-print-color-in-console-using-system-out-println
class Main {
	function new() {
		trace('this is the default trace');
		init();
	}

	function init() {
		Sys.println('this is the default sys.println');
		// logging via Haxe
		log("this is a log message");
		warn("this is a warn message");
		info("this is a info message");
	}

	static public function main() {
		var main = new Main();
	}
}
