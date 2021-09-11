package utils;

import haxe.io.Path;

class Read {
	public static function json(folderName:String, fileName:String):Dynamic {
		var root = Sys.getCwd();
		var folder = Path.removeTrailingSlashes('${root}/${folderName}');
		var file = '${folder}/${fileName}.json';

		var json:Dynamic;
		if (sys.FileSystem.exists(file)) {
			json = haxe.Json.parse(sys.io.File.getContent(file));
		} else {
			json = null;
		}
		return json;
	}
}
