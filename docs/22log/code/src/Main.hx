package;

import Colors.*;

// https://en.wikipedia.org/wiki/ANSI_escape_code
// https://github.com/haxiomic/console.hx/blob/master/Console.hx
// https://stackoverflow.com/questions/5762491/how-to-print-color-in-console-using-system-out-println
class Main {
	function new() {
		log('Hello world');
	}

	inline function log(v:Dynamic) {
		// Sys.println('> ' + v);
		Sys.println('${BLUE}→ ${RED_BOLD}${v} ${CYAN_BACKGROUND}-----${RESET}');
	}

	static public function main() {
		var main = new Main();
	}
}
