# Haxe and System targets

Documentation about using the system targets from Haxe.

The current targets that I have tested is

- cpp (C++)
- cs (C#)
- interp (Eval/Macro)
- java
- lua
- jvm
- neko
- node.js (without installing npm packages)
- python

But Haxe has more system targets, that probably work exactly the same:

- hl (hashlink)
- php

## Haxe libs

Read [download](docs/haxesys/download.md)

Read https://haxe.org/documentation/introduction/ - Setup your development environment

Here quick and dirty version

```bash
haxelib install hxcpp
haxelib install hxcs
haxelib install hxjava
```

#### Haxe C#

```
Compilation error
C# compiler not found. Please make sure either Visual Studio or mono is installed or they are reachable by their path
```

osx

```bash
brew install mono
```

#### Haxe Java

https://haxe.org/documentation/platforms/java.html

```bash
Compilation error
Java compiler not found. Please make sure JDK is installed. If it is, please add an environment variable called JAVA_HOME that points to the JDK install location or add the bin subfolder to your PATH environment.
```

OSX

> Install the latest Java Runtime Environment (JRE).

```bash
java -showversion
# The operation couldn’t be completed. Unable to locate a Java Runtime.
# Please visit http://www.java.com for information on installing Java.
brew install java
# follow instructions to "For the system Java wrappers to find this JDK, symlink it with"
#  ...
# check version
java -showversion
```

#### LUA

```
brew install lua
brew install luarocks
brew install cmake
```

And use `luarocks` to install dependency :

```bash
luarocks install lrexlib-pcre
luarocks install environ
luarocks install luasocket
luarocks install luv
luarocks install luautf8
luarocks install bit32 # depends on the version you install
luarocks install hx-lua-simdjson # when you want to work with json
```

#### Visit [http://matthijskamstra.github.io/haxesys/](http://matthijskamstra.github.io/haxesys/)

## How to contribute?

Read more about that [here](contribute.md).
But it boils down to: **JUST DO IT!**

#### Visit [https://github.com/MatthijsKamstra/haxesys](https://github.com/MatthijsKamstra/haxesys) to modify the "source" aka markdown files.

Found any "bug" or have a great idea? Please create a [new issue](https://github.com/MatthijsKamstra/haxesys/issues/new).

## How to build?

Use [Docsify](https://docsify.js.org/#/quickstart).
You need to install Node.js and then you automatically have NPM:

Install docsify

```bash
npm i docsify-cli -g
```

Use to serve docs

```bash
docsify serve docs
```

## Convert from Gitbook to Docsify

[Readmore](Docsify.md)
