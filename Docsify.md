# Convert from Gitbook to Docsify

I used Gitbook for generation of this documentation. However, recently I started looking for alternatives in case GitBook stops being free.
The tools I had didn't work anymore, didn't want to make an login on the new platform.

I have worked with docsify before and the migration is really easy.

## How to migrate to docsify.js?

First Install docsify:

```bash
npm  i docsify-cli -g
```

1. Initialize docsify on your repo folder: `docsify init docs` (default gitlab will use `docs` folder for documentation)
2. Rename `summary.md` to `_sidebar.md` (yes, it’s that simple!)
3. Copy all the folders/files into `docs` folder
4. Add loadSidebar: true to window.$docsify in index.html
5. That’s all there is to it! Now run: `docsify serve`
6. And push it to Github Pages as explained here.

## Resource

- https://docsify.js.org
- https://timdams.com/2019/05/02/migrating-from-gitbook-to-docsify-js/
