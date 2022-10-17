package;

import haxe.crypto.Adler32;
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

	var exampleArr = [];
	var languagesArr = []; // might need a map?
	var worksMap:Map<String, Array<Bool>> = []; // might need a map?
	var worksTwoMap:Map<String, Map<String, Bool>> = []; // might need a map?

	public function new() {
		// trace("Read project folder");
		// var path = Path.normalize('${Sys.getCwd()}/../../../');
		// trace(path);

		getBasic('${Sys.getCwd().split('/docs')[0]}/docs/00helloworld/code/build.hxml');

		sourcePath = Sys.getCwd().split('/docs')[0];
		// trace(sourcePath);
		recursiveLoop(sourcePath);
		// sort array
		buildPaths.sort((a:String, b:String) -> {
			if (a < b) {
				return -1;
			} else if (a > b) {
				return 1;
			} else {
				return 0;
			}
		});
		searchForFixit();

		// trace('exampleArr: ' + exampleArr);
		// trace('languagesArr: ' + languagesArr);
		// trace('worksMap: ' + worksMap);
		// trace('worksTwoMap: ' + worksTwoMap);

		outputReadme();
	}

	function outputReadme() {
		// log('outputReadme');
		// init markdown file
		var md = '| example |';
		var md2 = '| --- |';

		// setup first line
		for (j in 0...languagesArr.length) {
			var _languagesArr = languagesArr[j];
			md += ' ${_languagesArr} |';
			md2 += ' :---: |';
		}
		md += '\n${md2}';

		// next lines with example
		for (i in 0...exampleArr.length) {
			var exampleName = exampleArr[i];
			// trace(exampleName);

			md += '\n| ${exampleName} | ';

			// trace(worksTwoMap);

			for (j in 0...languagesArr.length) {
				var language = languagesArr[j];
				// trace(language);

				if (worksTwoMap.exists(exampleName)) {
					var map = worksTwoMap.get(exampleName);
					// trace(map);
					if (map.exists(language)) {
						if (map.get(language)) {
							md += ' ✅ |';
						} else {
							md += ' ❌ |';
						}
					} else {
						md += ' ✅ |';
					}
				} else {
					md += ' ✅ |';
				}
			}
		}
		log(md);
	}

	function getBasic(path) {
		var content = sys.io.File.getContent(path);
		// trace(content);
		// var arr = content.split('-cmd echo "  │ ├── ');
		var lines = content.split('\n');
		// trace(lines);
		var temp:Array<String> = [];
		for (i in 0...lines.length) {
			var line = lines[i];
			if (line.startsWith('-cmd echo "  │ ├── ')) {
				var language = line.replace('-cmd echo "  │ ├── ', '').replace('"', '').trim();
				temp.push(language);
				languagesArr.push(language);

				// var t = worksMap.get(language)
				worksMap.set(language, []);
				// worksTwoMap.set(language, new Map());
			}
		}

		// trace(languagesArr);
		// trace(worksMap);
	}

	function log(val:Dynamic) {
		Sys.println(val);
	}

	function searchForFixit() {
		// check for "FIXME"
		// trace(buildPaths.length);
		for (i in 0...buildPaths.length) {
			var path:String = buildPaths[i];
			// get project name
			var exampleName:String = '';
			if (path.indexOf('/docs') != -1) {
				// trace(path);
				var arr = path.split('/');
				exampleName = arr[7];
				// trace(exampleName);
				if (exampleName != 'haxe') {
					exampleArr.push(exampleName);
					worksTwoMap.set(exampleName, new Map());
				}
			}

			// trace(exampleName);

			var content = sys.io.File.getContent(path);
			// trace(path);
			// trace(content);
			if (content.indexOf('FIXME') != -1) {
				var arr = content.split('FIXME');
				// log('$path ${arr.length - 1}');
				for (i in 0...arr.length - 1) {
					var _arr = arr[i].trim();
					// trace(_arr);
					// var lang = _arr.split('─')[1].trim();
					var lang = _arr.substr(_arr.lastIndexOf(' '), _arr.length).trim();
					// // log('----------------------------');
					if (lang == '(Eval)')
						lang = 'interp (Eval)';
					// log('--- ' + lang);
					// // log('haxe ${path.replace('.hxml', '_${lang}.hxml')}');
					// // log('cd ${path.replace('.hxml', '_${lang}.hxml').replace('/','.')}');

					if (worksTwoMap.exists(exampleName)) {
						var map = worksTwoMap.get(exampleName);
						// trace(map);
						map.set(lang, false);
						worksTwoMap.set(exampleName, map);
					}
				}
			}
		}
		// trace("exampleArr: " + exampleArr);
	}

	// search for `docs/[projectname]/code/build.hxml`

	function recursiveLoop(directory:String = "path/to/") {
		if (sys.FileSystem.exists(directory)) {
			// // log("directory found: " + directory);
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					// // log("File found: " + path);
					// do something with file
					// // log(Path.withoutDirectory(path)); // if (path.indexOf())
					if (Path.withoutDirectory(path) == 'build.hxml') {
						// // log("File found: " + path);
						buildPaths.push(path);
					}
				} else {
					var directory = haxe.io.Path.addTrailingSlash(path);
					// // log("Directory found: " + directory);
					// if (path.indexOf('.git') != -1)
					// 	return;
					// if (path.indexOf('node_modules') != -1)
					// 	return;
					recursiveLoop(directory);
				}
			}
		} else {
			// trace('"$directory" does not exists');
		}
	}

	static public function main() {
		var app = new Main();
	}
}
