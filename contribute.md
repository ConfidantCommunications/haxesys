# Contribute!

This documentation hosted on Github, and pages are presented with Markdown using Docsify. The process should be very easy/familiar for developers.

Even if you are not a developer and don't want to clone everything, you still can edit the files directly from Github (you need account to login in and edit the `.md` files).

~~As a final resort, you can leave your comments/suggestions/etc. at the bottom of the page via Disqus.~~

##### Visit [https://github.com/MatthijsKamstra/haxesys](https://github.com/MatthijsKamstra/haxesys) to fork the documentation, or just report issues.

Found any "bug" or have a great idea? Please create a [new issue](https://github.com/MatthijsKamstra/haxesys/issues/new).

## Installation, and serve

```bash
npm i docsify-cli -g
docsify serve docs

```

## Tutorial structure

Every new tutorial should have:

```
+ foldername (use common sense)
	+ code (folder with code examples)
	|	+ bin
	|	+ src
	|	|	- Main.hx
	|	- build.hxml
	- about.md (short description what it will do)
	- install.md (is there something you need to install)
	- example.md (javscript.hxml, Main.hx, how to build, etc)
```

---
