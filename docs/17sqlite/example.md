# Example SQLite database

In the example with [HaxeLow](../04haxelow) we use a `.json` as database.
And we use a simular opproach with [flatfile](../16flatfile) `database`;

In this examle we will be using a SQLite database. This is a "normal" database but the lite version. It's the local database for a lot of (mobile)apps.

_The code used in this example is [here](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/10sqlite/code)._

The code used in this examle is from Jeff Ward (https://gist.github.com/jcward/a2bc21576cba2587bba1d18b647c0f7d)

The sqllite database (written to the local directory as test.db) works (interoperably) in Neko, hxcpp (and many other platforms.) See:

- https://api.haxe.org/sys/db/Connection.html
- https://api.haxe.org/sys/db/ResultSet.html

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

Check out the whole file here [Main.hx](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/10sqlite/code/Main.hx)

We will generate a `test.db`, and if you have not added the table "artist_backup" it will do that first.

Then add a "John" artist.

And then trace all the entries in the database.

```haxe

	var conn = sys.db.Sqlite.open("test.db");

	var rs = conn.request('
CREATE TABLE IF NOT EXISTS artists_backup
(
artistid INTEGER PRIMARY KEY AUTOINCREMENT,
name NVARCHAR
);');

	var rs = conn.request('
INSERT INTO artists_backup (name) VALUES ("John");');

	var rs = conn.request('
SELECT * FROM artists_backup;');

	trace('-- SELECT * FROM artists_backup');
	for (record in (rs : Iterator<ArtistsBackupRecord>)) {
		trace('${record.artistid}) ${record.name} --> ${haxe.Json.stringify(record)}');
	}

```

To convert the data back we use a typedef

```haxe
typedef ArtistsBackupRecord = {
	artistid:Int,
	name:String
}

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
