# Example

Simply write and read a file.

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

Open your favorite editor, copy/paste the code and save it in the `src` folder.

```haxe
class Main {
	function new(){
		trace("Reading and writing example");

		var str:String = 'Writing and reading a simple text file.!\nWritten on: ' + Date.now().toString();

		// write the file
		sys.io.File.saveContent('hello.txt', str);

		// read the file
		var content = sys.io.File.getContent('hello.txt');
		trace (content);
	}

	static public function main() {
		var main = new Main();
	}
}
```

## The Haxe build file, build.hxml

Normally you would have one `build.hxml` that would build everything you want to transpile to.
So you could build with one file many backends.

But not every feature works automaticly in all the languages and to prevent it from building I decided to have a little different structure.

Currently I use [`build_interp.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/02reading/code/build_interp.hxml) for vscode syntax checking:

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

To build all projects I use [`build.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/02reading/code/build.hxml) to build all other build files.

If a specific target doesn't work, I will explain it in this file

Check out this structure in the [`code`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/02reading/code)-folder.

## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter
