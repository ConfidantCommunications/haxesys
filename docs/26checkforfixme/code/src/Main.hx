package;

import haxe.io.Path;
import sys.io.FileOutput;
import sys.io.File;

using StringTools;

/**
 * https://code.haxe.org/category/beginner/using-filesystem.html
 */
class Main {
	var sourcePath = '';
	var buildPaths = [];

	public function new() {
		trace("Read project folder");
		// var path = Path.normalize('${Sys.getCwd()}/../../../');
		// trace(path);
		sourcePath = Sys.getCwd().split('/docs')[0];
		trace(sourcePath);
		recursiveLoop(sourcePath);
		init();
	}

	function log(val:Dynamic) {
		Sys.println(val);
	}

	function init() {
		// check for "FIXME"
		trace(buildPaths.length);
		for (i in 0...buildPaths.length) {
			var path = buildPaths[i];
			var content = sys.io.File.getContent(path);
			// trace(content);
			if (content.indexOf('FIXME') != -1) {
				var arr = content.split('FIXME');
				log('$path ${arr.length - 1}');
				for (i in 0...arr.length - 1) {
					var _arr = arr[i].trim();
					// trace(_arr);
					// var lang = _arr.split('─')[1].trim();
					var lang = _arr.substr(_arr.lastIndexOf(' '), _arr.length).trim();
					// log('----------------------------');
					if (lang == '(Eval)')
						lang = 'interp (Eval)';
					log('--- ' + lang);
					// log('haxe ${path.replace('.hxml', '_${lang}.hxml')}');
					// log('haxe ${path.replace('.hxml', '_${lang}.hxml').replace('/','.')}');
				}
			}
		}
	}

	// search for `docs/[projectname]/code/build.hxml`

	function recursiveLoop(directory:String = "path/to/") {
		if (sys.FileSystem.exists(directory)) {
			// log("directory found: " + directory);
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					// log("File found: " + path);
					// do something with file
					// log(Path.withoutDirectory(path)); // if (path.indexOf())
					if (Path.withoutDirectory(path) == 'build.hxml') {
						// log("File found: " + path);
						buildPaths.push(path);
					}
				} else {
					var directory = haxe.io.Path.addTrailingSlash(path);
					// log("Directory found: " + directory);
					// if (path.indexOf('.git') != -1)
					// 	return;
					// if (path.indexOf('node_modules') != -1)
					// 	return;
					recursiveLoop(directory);
				}
			}
		} else {
			trace('"$directory" does not exists');
		}
	}

	static public function main() {
		var app = new Main();
	}
}
