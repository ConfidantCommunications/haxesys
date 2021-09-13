# Install

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
