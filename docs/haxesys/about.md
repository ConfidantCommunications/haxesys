# About haxe system

## what works

| feature | cpp | cs  | hl  | interp | java | jvm | lua | neko | node | php | phython |
| ------- | :-: | :-: | :-: | :----: | :--: | :-: | :-: | :--: | :--: | :-: | :-----: |
| json    | ✅  | ✅  | ❓  |   ✅   |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅    |
| https   | ✅  | ❌  | ❓  |   ✅   |  ✅  | ✅  | ❌  |  ✅  |  ✅  | ❌  |   ✅    |

## examples that work on specific targets

Some example don't work because of "reasons", to have a overview, here is the list

| example         | cpp | cs  | interp (Eval) | java | lua | jvm | neko | node | php | python |
| --------------- | :-: | :-: | :-----------: | :--: | :-: | :-: | :--: | :--: | :-: | :----: |
| 00helloworld    | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 01writing       | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 02reading       | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 03append        | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 04haxelow       | ✅  | ✅  |      ✅       |  ✅  | ❌  | ❌  |  ✅  |  ❌  | ❌  |   ❌   |
| 06nasa          | ✅  | ❌  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ✅  |   ✅   |
| 06quote         | ✅  | ✅  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ✅  |   ✅   |
| 08json          | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 09socket        | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 10markdown      | ✅  | ✅  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 11resume        | ✅  | ✅  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 12cli           | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 13terminal      | ✅  | ✅  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ✅  |   ✅   |
| 14cli_progress  | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ❌  | ✅  |   ✅   |
| 15googlesheet   | ✅  | ❌  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ❌  |   ❌   |
| 16flatfile      | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 17sqlite        | ❌  | ❌  |      ❌       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ✅  |   ❌   |
| 18orm           | ❌  | ❌  |      ❌       |  ❌  | ❌  | ❌  |  ❌  |  ❌  | ❌  |   ❌   |
| 19untyped       | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 20build         | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 21download      | ✅  | ❌  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ✅  |   ❌   |
| 22log           | ❌  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 23trace         | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 24folder        | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
| 25haxeversion   | ✅  | ✅  |      ✅       |  ✅  | ❌  | ✅  |  ✅  |  ❌  | ✅  |   ✅   |
| 26checkforfixme | ✅  | ✅  |      ✅       |  ✅  | ✅  | ✅  |  ✅  |  ✅  | ✅  |   ✅   |
