# Example Nasa

Check the [code folder](https://github.com/MatthijsKamstra/haxesys/tree/master/06nasa/code) for more comments.

<https://github.com/HaxeFoundation/haxe/blob/945461390b774b761f57777365b1e0cbb3ac26be/std/sys/Http.hx#L98>

```
throw "Https is only supported with -lib hxssl";
```

This is an NASA api example.
You can get an api key if you plan to use it a lot and that is without a price.
But it also works without one.

_The code used in this example can be found [here](https://github.com/MatthijsKamstra/haxesys/tree/master/06nasa/code)._

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
Check the complete [Main.hx](https://github.com/MatthijsKamstra/haxesys/tree/master/06nasa/code/src/Main.hx).

This is the most interesting part:

```haxe
var req = new haxe.Http( 'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY' );

req.onData = function (data : String)
{
	try {
		var json haxe.Json.parse(data);
		trace(json);
	} catch (e:Dynamic){
		trace(e);
	}
}

req.onError = function (error : String)
{
	trace('error: $error');
}

req.onStatus = function (status : Int)
{
	// trace('status: $status');
}

req.request( false ); // false=GET, true=POST

```

## The Haxe build file, build.hxml

Normally you would have one `build.hxml` that would build everything you want to transpile to.
So you could build with one file many backends.

But not every feature works automaticly in all the languages and to prevent it from building I decided to have a little different structure.

Currently I use [`build.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/06nasa/code/build.hxml) for vscode syntax checking:

```bash
-lib markdown
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

To build all projects I use [`build_all.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/06nasa/code/build_all.hxml) to build all other build files.

If a specific target doesn't work, I will explain it in this file

Check out this structure in the [`code`](https://github.com/MatthijsKamstra/haxesys/tree/master/06nasa/code)-folder.

## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build_all.hxml`
3. type `haxe build_all.hxml`
4. press enter
