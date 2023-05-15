package;

import haxe.Json;
import sys.io.Process;
import haxe.io.Path;
import sys.io.Process;

using StringTools;

class Main {
	function new() {
		// check npm version
		Sys.println("What npm version is installed?");
		var command = Sys.command('npm', ['-v']);
		// only usefull if you don't want to use the value from the command

		// print a message on the screen
		Sys.println("What Haxe version is installed?");
		var p:Process = new Process('haxe', ['--version']);
		var out = p.stdout.readAll().toString();
		p.close();

		Sys.println('Haxe ${out}');

		var str:String = 'Haxe ${out.replace('\n', '')}\nWritten on: ' + Date.now().toString();
		sys.io.File.saveContent('haxe_version.txt', str);

		var str:String = Json.stringify({
			'Haxe': '${out.replace('\n', '')}',
			'created_date': Date.now().toString(),
		}, null, '  ');
		sys.io.File.saveContent('haxe_version.json', str);
	}

	static public function main() {
		var main = new Main();
	}
}
