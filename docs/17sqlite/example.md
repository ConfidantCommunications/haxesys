# Example SQLite database

In a previous example we used a simple flat-file 'database'.
An SQLite database is a database but the lite version. It's the local database for a lot of (mobile)apps.

_The code used in this example is [here](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/10sqlite/code)._

This examle is from: jsward (https://gist.github.com/jcward/a2bc21576cba2587bba1d18b647c0f7d)

## How to start

Create a folder named **foobar** (please use a better name; any name will do) and create folders **bin** and **src**.
See example below:

```
+ foobar
	+ bin
	+ src
		- Main.hx
	- php.hxml
```

## The Main.hx

This example is getting to big to post here, so if you want to check out the complete file go and check out [Main.hx](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/10sqlite/code/Main.hx)

First we need a database, so I wrote a class that creates one for you: `DBStart.hx`.
This class generates random users.

```haxe
	// Open a connection
	var cnx = sys.db.Sqlite.open("mybase.ddb");

	// Set as the connection for our SPOD manager
	sys.db.Manager.cnx = cnx;

	// initialize manager
	sys.db.Manager.initialize();

	// Create the "user" table
	if ( !sys.db.TableCreate.exists(User.manager) ) {
		sys.db.TableCreate.create(User.manager);
	}

	// Fill database with users
	for (i in 0 ... 10) {
		var user = createRandomUser();
		user.insert();
	}

	// close the connection and do some cleanup
	sys.db.Manager.cleanup();

	// Close the connection
	cnx.close();

```

The function `createRandomUser()` does what you would expect, if you want to know, check the source code.

A user!
We have used a `typedef` before, this looks similar.
The strange stuff here are the types, they are not the default types that Haxe uses.
Read more about that: [creating-a-spod](http://old.haxe.org/manual/spod#creating-a-spod).

```
import sys.db.Types;

class User extends sys.db.Object {
    public var id : SId;
    public var name : SString<32>;
    public var birthday : SDate;
    public var phoneNumber : SNull<SText>;
}

```

Now we have a database, lets check out the code to get the data from the database:

`Main.hx`

```
	// Open a connection
	var cnx = sys.db.Sqlite.open("mybase.ddb");

	// Set as the connection for our SPOD manager
	sys.db.Manager.cnx = cnx;

	// initialize manager
	sys.db.Manager.initialize();

	for (i in 0 ... User.manager.all().length) {
	 	var _user = User.manager.get(i);
	 	if(_user != null) trace(_user.name);
	}

	// close the connection and do some cleanup
	sys.db.Manager.cleanup();

	// Close the connection
	cnx.close();
```

## The Haxe build file, build.hxml

Normally you would have one `build.hxml` that would build everything you want to transpile to.
So you could build with one file many backends.

But not every feature works automaticly in all the languages and to prevent it from building I decided to have a little different structure.

Currently I use [`build_interp.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/15googlesheet/code/build_interp.hxml) for vscode syntax checking:

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

To build all projects I use [`build.hxml`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/15googlesheet/code/build.hxml) to build all other build files.

If a specific target doesn't work, I will explain it in this file

Check out this structure in the [`code`](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/15googlesheet/code)-folder.

## Build all targets with Haxe and start the specific target

To finish and see what we have, build the file and see the result

1. Open your terminal
2. `cd ` to the correct folder where you have saved the `build.hxml`
3. type `haxe build.hxml`
4. press enter
