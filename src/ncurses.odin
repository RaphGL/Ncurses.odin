package ncurses

import "core:c"

foreign import ncurses "system:ncurses"

@(private = "file")
_win_st :: struct {}
Window :: _win_st

foreign ncurses {
	initscr :: proc() -> ^Window ---
	halfdelay :: proc(timeout: c.int) -> c.int ---

	refresh :: proc() -> c.int ---
	wrefresh :: proc(win: ^Window) -> c.int ---

	endwin :: proc() -> c.int ---

	raw :: proc() -> c.int ---
	noraw :: proc() -> c.int ---

	cbreak :: proc() -> c.int ---
	nocbreak :: proc() -> c.int ---

	echo :: proc() -> c.int ---
	noecho :: proc() -> c.int ---

	curs_set :: proc(visibility: c.int) -> c.int ---
}
