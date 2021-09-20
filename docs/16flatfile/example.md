# Example flat file

We are going to read and write a json file as if it was a database.
You could call it a flat-file database.

Check the [code folder](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/09flatfile/code) for more comments.

In this example we are going to read and use a `.json` file.

## Lua json support

All the targets support json "out-of-the-box".

The only target that needs an extra library is Lua (you only need to install this once):

```bash
luarocks install hx-lua-simdjson
```

## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ bin
	+ src
		- Main.hx
	- build.hxml
```

## The Main.hx

This example is getting to big to post here, so if you want to check out the complete file go and check out [Main.hx](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/09flatfile/code/Main.hx)

The next code wil do that following

- load the data
- `if` the data == null
  - generate a json with current date
- `else` use the loaded data to
  - keep the created date the same
  - change the update
  - and `+1` the counter
- and write it down
- output the json

```haxe
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

```

In the folder `utils` you will find a `Read.hx`
It has a static function `json` that will read the file (if it exists)

- it will check `if` the file exists
  - get the content of that file
  - parse it to json
- `else` if will return null

```haxe
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
```

In that same folder folder `utils` you will find a `Write.hx`
It has a static function `json` which writes the file to the system

- it will check `if` the folder exists
  - if not create the folder
- check if the creation of the folder worked
- write the file

```haxe
public static function json(folderName:String, fileName:String, data:Dynamic) : Void
{
	var _path = Sys.getCwd() + '/$folderName/';
	if(! sys.FileSystem.exists( _path ) ){
		sys.FileSystem.createDirectory( _path );
	}

	if(!sys.FileSystem.exists(_path)){
	 	try {
			throw "Error";
		} catch( msg : String ) {
			trace("Error occurred: " + msg);
		}
	}
	var _fileName = fileName + ".json" ;
	var _filePath = _path + "" + _fileName;
    var f:FileOutput = File.write(_filePath,false);
    f.writeString(haxe.Json.stringify(data));
    f.close();
}
```

To make that easier I use [`typedef`](http://haxe.org/manual/type-system-typedef.html)

We convert the json data to `CounterData` so when we use a IDE it will use autocompletion

```haxe
typedef CounterData = {
	var uTime:Float;
	var cTime:Float;
	var update:String;
	var created:String;
	var counter:Int;
}

```

## The Haxe build file, build.hxml

Normally you would have one `build.hxml` that would build everything you want to transpile to.
So you could build with one file many backends.

But not every feature works automaticly in all the languages and to prevent it from building I decided to have a little different structure.

Currently I use [`build_interp.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/16flatfile/code/build_interp.hxml) for vscode syntax checking:

```bash
-cp src
-D analyzer-optimize
-main Main
--interp
```

And have individual build files for the different targets:

- build_cpp.hxml
- build_cs.hxml
- build_interp.hxml
- build_java.hxml
- build_jvm.hxml
- build_lua.hxml
- build_neko.hxml
- build_node.hxml
- build_python.hxml

To build all projects I use [`build.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/16flatfile/code/build.hxml) to build all other build files.

If a specific target doesn't work, I will explain it in this file

Check out this structure in the [`code`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/16flatfile/code)-folder.

## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter
