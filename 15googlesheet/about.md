# Google sheet

Easy way to use google sheet as a "database"

Google Sheets can be a great place to store content for a website, since it's structured and easy to update (especially for non-coders).

There's a very useful but obscure way of getting an API for reading a Google Sheet, that doesn't require authentication or complicated permissions. Plus, it updates immediately when the spreadsheet is edited, without delay.

## Catches

Node.js doesn't get the csv but the json file ????

Python target creates a error

```
error: SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: self signed certificate (_ssl.c:1129)')
```

Lua target doesn't support https

```
Https support in haxe.Http is not implemented for this target in sys.Http.customRequest at sys/Http.hx:112
```

C# target doesn't support https

```
Https support in haxe.Http is not implemented for this target in sys.Http.customRequest at sys/Http.hx:112
[ERROR] FATAL UNHANDLED EXCEPTION: Https support in haxe.Http is not implemented for this target in sys.Http.customRequest at sys/Http.hx:112
```

## New Method

- Open the Google Sheet and share the spreadsheet (button in the top right corner) so anyone with the link can view it without logging in.
- Copy the spreadsheet ID, which is the long random string in the URL of the spreadsheet. Make sure to copy the entire random part of the URL between two slashes.
- We’ll be using this URL to get the spreadsheet’s data, replacing spreadsheet_id with your spreadsheet ID from the previous step:

```
https://docs.google.com/spreadsheets/d/spreadsheet_id/gviz/tq?tqx=out:json
```

This endpoint doesn’t quite return JSON, but it returns a function call that wraps JSON. Here’s how you can get the data you want using the JavaScript fetch API:

## Reading other sheets in your spreadsheet

You can add `&sheet=Other Sheet Name` to the end of the URL to get data from another sheet/tab.

## source:

- https://benborgers.com/posts/google-sheets-json
- https://andregarzia.com/2018/11/reading-google-sheets-data-from-livecode.html
