# Example

Read a folder and its content, search for specifics

I use it to generate a view based upon the `FIXME` in the `build.hxml`

This example is based upon the [folder example](../24folder/).

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

```

## The Haxe build file, build.hxml

Normally you would have one `build.hxml` that would build everything you want to transpile to.
So you could build with one file many backends.

But not every feature works automaticly in all the languages and to prevent it from building I decided to have a little different structure.

Currently I use [`build_interp.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/26checkforfixme/code/build_interp.hxml) for vscode syntax checking:

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

To build all projects I use [`build.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/26checkforfixme/code/build.hxml) to build all other build files.

If a specific target doesn't work, I will explain it in this file

Check out this structure in the [`code`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/26checkforfixme/code)-folder.

## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter
