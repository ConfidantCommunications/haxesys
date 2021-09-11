package;

import utils.*;

class Main {
	public function new() {
		var json:CounterData = Read.json('_data', 'test');

		if (json == null) {
			json = {
				uTime: Date.now().getTime(),
				cTime: Date.now().getTime(),
				update: Date.now().toString(),
				created: Date.now().toString(),
				counter: 0,
			};
		} else {
			var count = json.counter + 1;
			json = {
				uTime: Date.now().getTime(),
				cTime: json.cTime,
				update: Date.now().toString(),
				created: json.created,
				counter: count
			};

			Sys.println('creation date: ' + Date.fromString(json.created));
		}
		utils.Write.json('_data', 'test', json);

		Sys.println(json);
	}

	static public function main():Void {
		var main = new Main();
	}
}

typedef CounterData = {
	var uTime:Float;
	var cTime:Float;
	var update:String;
	var created:String;
	var counter:Int;
}
