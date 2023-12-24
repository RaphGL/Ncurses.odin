package ncurses

import "core:c"
foreign import ncurses "system:ncurses"

@(private)
foreign ncurses {
	getattrs :: proc(win: ^Window) -> c.int ---
	getcurx :: proc(win: ^Window) -> c.int ---
	getcury :: proc(win: ^Window) -> c.int ---
	getbegx :: proc(win: ^Window) -> c.int ---
	getbegy :: proc(win: ^Window) -> c.int ---
	getmaxx :: proc(win: ^Window) -> c.int ---
	getmaxy :: proc(win: ^Window) -> c.int ---
	getparx :: proc(win: ^Window) -> c.int ---
	getpary :: proc(win: ^Window) -> c.int ---
}

foreign ncurses {
	stdscr: ^Window

	newwin :: proc(h, w, y, x: c.int) -> ^Window ---
	delwin :: proc(win: ^Window) -> c.int ---

	box :: proc(win: ^Window, verch, horch: c.int) ---
	border :: proc(ls, rs, ts, bs, tl, tr, bl, br: c.int) ---
	wborder :: proc(win: ^Window, ls, rs, ts, bs, tl, tr, bl, br: c.int) ---

	clear :: proc() -> c.int ---
	wclear :: proc(win: ^Window) -> c.int ---

	clrtoeol :: proc() -> c.int ---
	wclrtoeol :: proc(win: ^Window) -> c.int ---

	erase :: proc() -> c.int ---
	werase :: proc(win: ^Window) -> c.int ---
}

getyx :: proc(win: ^Window) -> (y, x: c.int) {return getcury(win), getcurx(win)}
getbegyx :: proc(win: ^Window) -> (y, x: c.int) {return getbegy(win), getbegx(win)}
getmaxyx :: proc(win: ^Window) -> (y, x: c.int) {return getmaxy(win), getmaxx(win)}
getparyx :: proc(win: ^Window) -> (y, x: c.int) {return getpary(win), getparx(win)}
