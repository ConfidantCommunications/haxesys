package;

import haxe.io.Bytes;
import sys.io.FileOutput;
import sys.io.File;

class Main {
	function new() {
		getUrl('https://matthijskamstra.nl/images/1/6/d/e/9/16de940748f3f09cf4f4684dc36ec9364f8caa01-08120140726133615.png', false);
	}

	function getUrl(url:String, isPost:Bool = false):Void {
		var req = new haxe.Http(url);

		req.onData = function(data:String) {
			try {
				// trace(data);
				trace('image loaded');
				var bytes = Bytes.ofString(data);
				// var bytes = haxe.Resource.getBytes('icon');
				var fo:FileOutput = sys.io.File.write('test.png', true);
				fo.write(bytes);
				fo.close();
				trace('image saved');
			} catch (e:Dynamic) {
				trace(e);
			}
		}

		req.onError = function(error:String) {
			trace('error: $error');
		}

		req.onStatus = function(status:Int) {
			trace('status: $status');
		}

		req.request(isPost); // false=GET, true=POST
	}

	static public function main() {
		var main = new Main();
	}
}
