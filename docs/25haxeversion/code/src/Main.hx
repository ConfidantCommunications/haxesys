package;

import haxe.Json;
import sys.io.Process;
import haxe.io.Path;
import sys.io.Process;

using StringTools;

class Main {
	function new() {
		// print a message on the screen
		Sys.println("What Haxe version is installed?");
		var p:Process = new Process('haxe', ['--version']);
		var out = p.stdout.readAll().toString();
		p.close();

		Sys.println('Haxe ${out}');

		var str:String = 'Haxe ${out.replace('\n', '')}\nWritten on: ' + Date.now().toString();
		sys.io.File.saveContent('haxe_version.txt', str);

		var str:String = Json.stringify({
			'Haxe': ${out.replace('\n', '')},
			'created_date': Date.now().toString(),
		});
		sys.io.File.saveContent('haxe_version.json', str);
	}

	static public function main() {
		var main = new Main();
	}
}
