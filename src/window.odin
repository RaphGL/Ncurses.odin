package ncurses

import "core:c"
foreign import ncurses "system:ncurses"

@(private)
foreign ncurses {
	getattrs :: proc(win: ^Window) -> c.int --- /* generated */
	getcurx :: proc(win: ^Window) -> c.int --- /* generated */
	getcury :: proc(win: ^Window) -> c.int --- /* generated */
	getbegx :: proc(win: ^Window) -> c.int --- /* generated */
	getbegy :: proc(win: ^Window) -> c.int --- /* generated */
	getmaxx :: proc(win: ^Window) -> c.int --- /* generated */
	getmaxy :: proc(win: ^Window) -> c.int --- /* generated */
	getparx :: proc(win: ^Window) -> c.int --- /* generated */
	getpary :: proc(win: ^Window) -> c.int --- /* generated */
}

getyx :: proc(win: ^Window) -> (y, x: c.int) {return getcury(win), getcurx(win)}
getbegyx :: proc(win: ^Window) -> (y, x: c.int) {return getbegy(win), getbegx(win)}
getmaxyx :: proc(win: ^Window) -> (y, x: c.int) {return getmaxy(win), getmaxx(win)}
getparyx :: proc(win: ^Window) -> (y, x: c.int) {return getpary(win), getparx(win)}
