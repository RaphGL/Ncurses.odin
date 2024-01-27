package ncurses

import "core:c"
foreign import ncurses "system:ncurses"

@(private = "file")
_win_st :: struct {}

Window :: distinct _win_st

@(private)
foreign ncurses {
	acs_map: [^]c.uint

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
	LINES: c.int
	COLS: c.int

	// The upper left-hand corner of the window is at line y, column x. 
	// If either h or w is zero, they default to LINES - y and COLS - x.
	//
	// A new full-screen window is created by calling newwin(0, 0, 0, 0). 
	newwin :: proc(h, w, y, x: c.int) -> ^Window ---
	// Deletes the named window, freeing all memory associated with it (it does not actually erase the window's screen image).
	//
	// Subwindows must be deleted before the main window can be deleted. 
	//
	// Returns an error if the window pointer is null, or if the window is the parent of another window. 
	delwin :: proc(win: ^Window) -> c.int ---

	// moves the window so that the upper left-hand corner is at position (x, y).
	// If the move would cause the window to be off the screen, it is an error and the window is not moved.
	// Moving subwindows is allowed, but should be avoided. 
	mvwin :: proc(win: ^Window, y, x: c.int) ---

	// Draw a box around the edges of a window.
	//
	// verch: vertical character
	// horch: horizontal character
	box :: proc(win: ^Window, verch, horch: c.int) ---
	// Draw a box around the edges of stdscr.
	//
	// ls: left side,
	// rs: right side,
	// ts: top side,
	// bs: bottom side,
	// tl: top left-hand corner,
	// tr: top right-hand corner,
	// bl: bottom left-hand corner, and
	// br: bottom right-hand corner. 
	//
	// If any of these arguments is zero, then the corresponding default values are used instead:
	// ACS_VLINE,
	// ACS_VLINE,
	// ACS_HLINE,
	// ACS_HLINE,
	// ACS_ULCORNER,
	// ACS_URCORNER,
	// ACS_LLCORNER,
	// ACS_LRCORNER.
	border :: proc(ls, rs, ts, bs, tl, tr, bl, br: c.uint) ---
	// Draw a box around the edges of a window.
	//
	// ls: left side,
	// rs: right side,
	// ts: top side,
	// bs: bottom side,
	// tl: top left-hand corner,
	// tr: top right-hand corner,
	// bl: bottom left-hand corner, and
	// br: bottom right-hand corner. 
	//
	// If any of these arguments is zero, then the corresponding default values are used instead:
	// ACS_VLINE,
	// ACS_VLINE,
	// ACS_HLINE,
	// ACS_HLINE,
	// ACS_ULCORNER,
	// ACS_URCORNER,
	// ACS_LLCORNER,
	// ACS_LRCORNER.
	wborder :: proc(win: ^Window, ls, rs, ts, bs, tl, tr, bl, br: c.uint) ---

	// The clear and wclear routines are like erase and werase, but they also call clearok,
	// so that the screen is cleared completely on the next call to wrefresh for that window and repainted from scratch. 
	clear :: proc() -> c.int ---
	// The clear and wclear routines are like erase and werase, but they also call clearok,
	// so that the screen is cleared completely on the next call to wrefresh for that window and repainted from scratch. 
	wclear :: proc(win: ^Window) -> c.int ---

	// Erase from the cursor to the end of screen.
	clrtoeol :: proc() -> c.int ---
	// Erase from the cursor to the end of screen.
	wclrtoeol :: proc(win: ^Window) -> c.int ---

	// Copy blanks to every position in stdscr, clearing the screen.
	erase :: proc() -> c.int ---
	// Copy blanks to every position in the window, clearing the screen.
	werase :: proc(win: ^Window) -> c.int ---

	// Resize the window. If either dimension is larger than the current values, the window's data is filled with blanks that have the current background rendition (as set by wbkgndset) merged into them.
	wresize :: proc(win: ^Window, h, w: c.int) -> c.int ---
}

// Get the current coordinates of the cursor.
getyx :: proc(win: ^Window) -> (y, x: c.int) {return getcury(win), getcurx(win)}
// Get absolute screen coordinates of the specified window. 
getbegyx :: proc(win: ^Window) -> (y, x: c.int) {return getbegy(win), getbegx(win)}
// Get the size of the current window.
getmaxyx :: proc(win: ^Window) -> (y, x: c.int) {return getmaxy(win), getmaxx(win)}
// Get the beginning coordinates of the subwindow relative to the parent window.
getparyx :: proc(win: ^Window) -> (y, x: c.int) {return getpary(win), getparx(win)}

// -- VT100 symbols begin here 

// upper left corner 
ACS_ULCORNER := acs_map['l']
// lower left corner 
ACS_LLCORNER := acs_map['m']
// upper right corner 
ACS_URCORNER := acs_map['k']
// lower right corner 
ACS_LRCORNER := acs_map['j']
// tee pointing right 
ACS_LTEE := acs_map['t']
// tee pointing left 
ACS_RTEE := acs_map['u']
// tee pointing up 
ACS_BTEE := acs_map['v']
// tee pointing down 
ACS_TTEE := acs_map['w']
// horizontal line 
ACS_HLINE := acs_map['q']
// vertical line 
ACS_VLINE := acs_map['x']
// large plus or crossover 
ACS_PLUS := acs_map['n']
// scan line 1 
ACS_S1 := acs_map['o']
// scan line 9 
ACS_S9 := acs_map['s']
// diamon] 
ACS_DIAMOND := acs_map['`']
// checker board (stipple) 
ACS_CKBOARD := acs_map['a']
// degree symbol 
ACS_DEGREE := acs_map['f']
// plus/minus 
ACS_PLMINUS := acs_map['g']
// bulle] 
ACS_BULLET := acs_map['~']

// -- Teletype 5410v1 symbols begin here 

ACS_LARROW := acs_map[','] /* arro] pointing left */
ACS_RARROW := acs_map['+'] /* arro] pointing right */
ACS_DARROW := acs_map['.'] /* arro] pointing down */
ACS_UARROW := acs_map['-'] /* arrow pointing up */
ACS_BOARD := acs_map['h'] /* board of squares */
ACS_LANTERN := acs_map['i'] /* lantern symbol */
ACS_BLOCK := acs_map['0'] /* solid square block */

// -- These aren't documented, but a lot of System Vs have them anyway
// -- (you can spot pprryyzz{{||}} in a lot of AT&T terminfo strings).
// -- The ACS_names may not match AT&T's, our source didn't know them.

// scan line 3 
ACS_S3 := acs_map['p']
// scan line 7 
ACS_S7 := acs_map['r']
// less/equal 
ACS_LEQUAL := acs_map['y']
// greater/equal 
ACS_GEQUAL := acs_map['z']
// Pi 
ACS_PI := acs_map['{']
// not equal 
ACS_NEQUAL := acs_map['|']
// UK pound sign 
ACS_STERLING := acs_map['}']
