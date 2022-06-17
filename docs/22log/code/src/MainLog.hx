package;

import log.Colors.*;

class MainLog {
	function new() {
		trace('this is the default trace');
		// now we are going to overwrite the default trace with our own
		haxe.Log.trace = function(v:Dynamic, ?infos:haxe.PosInfos) {
			var str = '${BLUE}→ ${RED_UNDERLINED}${infos.fileName}:${infos.lineNumber} ${RED_BOLD}${v} ${CYAN_BACKGROUND}-----${RESET}';
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
		var main = new MainLog();
	}
}
