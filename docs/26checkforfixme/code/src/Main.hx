package;

import sys.io.FileOutput;
import sys.io.File;

/**
 * https://code.haxe.org/category/beginner/using-filesystem.html
 */
class Main {
	public function new() {
		trace("Read folder");
		recursiveLoop(Sys.getCwd());
	}

	function recursiveLoop(directory:String = "path/to/") {
		if (sys.FileSystem.exists(directory)) {
			trace("directory found: " + directory);
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					trace("file found: " + path);
					// do something with file
				} else {
					var directory = haxe.io.Path.addTrailingSlash(path);
					trace("directory found: " + directory);
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
