# Install

We will install record-macros for this project.
Because of this library you can choose SQLite and or SQL database.

> Record macros is a macro-based library that provides object-relational mapping to Haxe. With record-macros, you can define some Classes that will map to your database tables. You can then manipulate tables like objects, by simply modifying the table fields and calling a method to update the datas or delete the entry. For most of the standard stuff, you only need to provide some basic declarations and you don't have to write one single SQL statement. You can later extend record-macros by adding your own SQL requests for some application-specific stuff.

source: https://github.com/HaxeFoundation/record-macros

Macro-based ORM (object-relational mapping)

The current haxelib installed version of record-macros seems a bit old, so we are going to install directly from the repo:

Copy paste the following in your terminal:

```bash
haxelib git record-macros https://github.com/HaxeFoundation/record-macros.git
```

Don't forget to add the following to your build.hxml file

```bash
--lib record-macros
```

If you use this library without installing you wil get the message:

```bash
Library record-macros is not installed : run 'haxelib install record-macros'
```

Use the line I mention earlier.

# Install SQLite

> This is directly from [example 17 SQLite](../../17sqlite)

Not all system target support sqlite, there is some targets that don't work and others that need some help (read more about it in the Haxe documentation https://api.haxe.org/sys/db/Sqlite.html)

The documentation tells us that sqlite are available on `php`, `neko`, `cpp`, `java`, `lua`, `python`, `hl`

In this example I'm not going to test

- hl

so I am not sure if it works or not.

The targets I have tested;

- php
- cpp
- cs (need to install something, didn't do that, so I don't know)
- java
- jvm
- neko

Not implemented for this platform

- node
- interp
- python (which is weird, but compiler says NO)
- lua (which is weird, but compiler says NO)

I have documented in the [build.hxml](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/17sqlite/code/build.hxml)

## Install for CS (C#)

The documentation tells us that for CS (C# ) you need to install

> (cs) You will need a SQLite ADO.NET Provider (see http://www.mono-project.com/docs/database-access/providers/sqlite/). Also note that this will try to open an assembly named Mono.Data.Sqlite if it wasn't loaded yet.

But I've haven't tested it...

## Install for JAVA and JVM

(java) You will need a SQLite JDBC driver (e.g. https://github.com/xerial/sqlite-jdbc/releases)

That file needs in the root of the `build_java.hxml`/`build_jvm.hxml` and added to the build file:

`--java-lib sqlite-jdbc.jar`

As you might have noticed I removed the current version to keep it future proof.

To make it even easier I added a bash-script to the [build_java.hxml](https://github.com/MatthijsKamstra/haxesys/tree/master/docs/17sqlite/code/build.hxml)

Bash script will check if you have it installed:

```bash
FILE=sqlite-jdbc.jar
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
    curl -L -H "Accept: application/zip" https://github.com/xerial/sqlite-jdbc/releases/download/3.36.0.3/sqlite-jdbc-3.36.0.3.jar -o sqlite-jdbc.jar
fi
```
