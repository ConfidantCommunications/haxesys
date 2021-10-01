package;
import Colors.*;

class Logger {

	public static inline function log(v:Dynamic) {
		// Sys.println('> ' + v);
		Sys.println('${BLUE}→ ${WHITE}${v}${RESET}');
	}
	public static inline function info(v:Dynamic) {
		Sys.println('${BLUE}♥ ${GREEN}${v}${RESET}');
	}
	public static inline function warn(v:Dynamic) {
		Sys.println('${BLUE}⚠ ${BLACK}${RED_BACKGROUND}${v}${RESET}');
	}
}