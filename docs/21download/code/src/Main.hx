package;

import haxe.io.Bytes;
import sys.io.FileOutput;
import sys.io.File;

class Main {
	function new() {
		getUrl('test.png', 'https://matthijskamstra.nl/images/1/6/d/e/9/16de940748f3f09cf4f4684dc36ec9364f8caa01-08120140726133615.png', false);
		// getUrl('test_other.jpeg', 'https://matthijskamstra.nl/images/8/6/1/5/b/8615b45d58c7bfdb3570bf510dad11b7e7bb7361-015pumasuede.jpeg', false);
		getUrl('test_mck.jpg', 'https://matthijskamstra.nl/user/pages/05.about/matthijs_profile.jpg', false);
	}

	/**
	 * [Description]
	 * @param name
	 * @param url
	 * @param isPost
	 */
	function getUrl(name:String, url:String, isPost:Bool = false):Void {
		var req = new haxe.Http('${url}?${Date.now().getTime()}');
		req.onData = function(data:String) {
			try {
				trace(data.length); // 259052
				trace('image-  loaded: ${name}');
				var bytes = Bytes.ofString(data, haxe.io.Encoding.RawNative);
				// var bytes = haxe.Resource.getBytes('icon');
				var fo:FileOutput = sys.io.File.write('1_' + name, true);
				fo.write(bytes);
				fo.close();
				trace('image-1 saved: "1_${name}"');
				File.saveBytes('2_' + name, bytes);
				trace('image-2 saved: "2_${name}"');
			} catch (e:Dynamic) {
				trace('---');
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
