# Example

Simply append to an existing file

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
package;

import sys.io.FileOutput;
import sys.io.File;

class Main {
	public function new() {
		trace("Appending string to file example");

		var str:String = '\n- current update: ${Date.now()}';

		var output = File.append('error.txt', false);
		output.writeString(str);
		output.close();
	}

	static public function main() {
		var app = new Main();
	}
}

```

## The Haxe build file, build.hxml

Normally you would have one `build.hxml` that would build everything you want to transpile to.
So you could build with one file many backends.

But not every feature works automaticly in all the languages and to prevent it from building I decided to have a little different structure.

Currently I use [`build.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/03append/code/build.hxml) for vscode syntax checking:

```bash
-cp src
--main Main
-dce full
-D analyzer-optimize
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

To build all projects I use [`build_all.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/03append/code/build_all.hxml) to build all other build files.

If a specific target doesn't work, I will explain it in this file

Check out this structure in the [`code`](https://github.com/MatthijsKamstra/haxesys/tree/master/03append/code)-folder.

## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build_all.hxml`
3. type `haxe build_all.hxml`
4. press enter
