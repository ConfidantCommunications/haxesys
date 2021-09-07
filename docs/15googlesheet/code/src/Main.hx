package;

import haxe.Http;

/**
 * @author Matthijs Kamstra aka [mck]
 */
class Main {
	var sheetKey = '1YvqXk9M41QY-prmNFFFL3MNN5bYQHgpIUpZggD7ci2U';
	var sheetName = 'estimate_2022';

	function new() {
		trace('Google sheet example');

		// https://docs.google.com/spreadsheets/d/1YvqXk9M41QY-prmNFFFL3MNN5bYQHgpIUpZggD7ci2U/edit?usp=sharing

		loadData('https://docs.google.com/spreadsheets/d/${sheetKey}/gviz/tq?tqx=out:csv&sheet=${sheetName}', false);
	}

	function loadData(url:String, isPost:Bool = false):Void {
		var req = new haxe.Http(url);

		req.onData = function(data:String) {
			try {
				trace(data); // should be a .csv file
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

	static public function main():Void {
		var main = new Main();
	}
}
