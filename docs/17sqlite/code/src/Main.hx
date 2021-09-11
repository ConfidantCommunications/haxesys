package;

import haxe.SysTools;

class Main {
	public static function main() {
		trace("Sqlite example");

		trace(Sys.getCwd());
		// trace(Sys.programPath());

		var conn = sys.db.Sqlite.open("test.db");

		// trace(conn);

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
	}
}

typedef ArtistsBackupRecord = {
	artistid:Int,
	name:String
}
