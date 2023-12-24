package ncurses

import "core:c"
foreign import ncurses "system:ncurses"

foreign ncurses {
	keypad :: proc(win: ^Window, enable: bool) -> c.int ---

	// INPUT

	getch :: proc() -> c.int ---
	wgetch :: proc(win: ^Window) -> c.int ---
	mvgetch :: proc(y, x: c.int) -> c.int ---
	mvwgetch :: proc(win: ^Window, y, x: c.int) -> c.int ---

	getstr :: proc(str: [^]byte) -> c.int ---
	wgetstr :: proc(win: ^Window, str: [^]byte) -> c.int ---
	getnstr :: proc(str: [^]byte, n: c.int) -> c.int ---
	mvgetstr :: proc(y, x: c.int, str: [^]byte) -> c.int ---
	mvwgetstr :: proc(win: ^Window, y, x: c.int, str: [^]byte) -> c.int ---
	mvgetnstr :: proc(y, x: c.int, str: [^]byte, n: c.int) -> c.int ---
	mvwgetnstr :: proc(win: ^Window, y, x: c.int, str: [^]byte, n: c.int) -> c.int ---
	wgetnstr :: proc(win: ^Window, str: [^]byte, n: c.int) -> c.int ---

	ungetch :: proc(char: c.int) -> c.int ---

	scanw :: proc(fmt: cstring, #c_vararg args: ..any) -> c.int ---
	wscanw :: proc(win: ^Window, fmt: cstring, #c_vararg args: ..any) -> c.int ---
	mvscanw :: proc(y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---
	mvwscanw :: proc(win: ^Window, y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---


	// OUTPUT 

	printw :: proc(fmt: cstring, #c_vararg args: ..any) -> c.int ---
	wprintw :: proc(win: ^Window, fmt: cstring, #c_vararg args: ..any) -> c.int ---
	mvprintw :: proc(y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---
	mvwprintw :: proc(win: ^Window, y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---

	addch :: proc(char: c.uint) -> c.int ---
	waddch :: proc(win: ^Window, char: c.uint) -> c.int ---
	mvaddch :: proc(y, x: c.int, char: c.uint) -> c.int ---
	mvwaddch :: proc(win: ^Window, y, x: c.int, char: c.uint) -> c.int ---

	addstr :: proc(str: cstring) -> c.int ---
	waddstr :: proc(win: ^Window, str: cstring) -> c.int ---
	mvaddstr :: proc(y, x: c.int, str: cstring) -> c.int ---
	mvwaddstr :: proc(win: ^Window, y, x: c.int, str: cstring) -> c.int ---

	move :: proc(y, x: c.int) -> c.int ---
	wmove :: proc(win: ^Window, y, x: c.int) ---

}

KEY_F :: #force_inline proc(n: c.int) -> c.int {
	return c.int(Key.F0) + n
}

Key :: enum c.int {
	// down-arrow key 
	Down      = 0o402,
	// up-arrow key 
	Up        = 0o403,
	// left-arrow key 
	Left      = 0o404,
	// right-arrow key 
	Right     = 0o405,
	// home key 
	Home      = 0o406,
	// backspace key 
	Backspace = 0o407,
	// Function keys.  Space for 64 
	F0        = 0o410,
	F1        = 0o411,
	F2        = 0o412,
	F3        = 0o413,
	F4        = 0o414,
	F5        = 0o415,
	F6        = 0o416,
	F7        = 0o417,
	F8        = 0o420,
	F9        = 0o421,
	F10       = 0o422,
	F11       = 0o423,
	F12       = 0o424,
	// delete-line key 
	DL        = 0o510,
	// insert-line key 
	IL        = 0o511,
	// delete-character key 
	DC        = 0o512,
	// insert-character key 
	IC        = 0o513,
	// sent by rmir or smir in insert mode 
	EIC       = 0o514,
	// clear-screen or erase key 
	Clear     = 0o515,
	// clear-to-end-of-screen key 
	EOS       = 0o516,
	// clear-to-end-of-line key 
	EOL       = 0o517,
	// scroll-forward key 
	SF        = 0o520,
	// scroll-backward key 
	SR        = 0o521,
	// next-page key 
	NPage     = 0o522,
	// previous-page key 
	PPage     = 0o523,
	// set-tab key 
	STab      = 0o524,
	// clear-tab key 
	CTab      = 0o525,
	// clear-all-tabs key 
	CATab     = 0o526,
	// enter/send key 
	Enter     = 0o527,
	// print key 
	Print     = 0o532,
	// lower-left key (home down) 
	LL        = 0o533,
	// upper left of keypad 
	A1        = 0o534,
	// upper right of keypad 
	A3        = 0o535,
	// center of keypad 
	B2        = 0o536,
	// lower left of keypad 
	C1        = 0o537,
	// lower right of keypad 
	C3        = 0o540,
	// back-tab key 
	BTab      = 0o541,
	// begin key 
	Beg       = 0o542,
	// cancel key 
	Cancel    = 0o543,
	// close key 
	Close     = 0o544,
	// command key 
	Command   = 0o545,
	// copy key 
	Copy      = 0o546,
	// create key 
	Create    = 0o547,
	// end key 
	End       = 0o550,
	// exit key 
	Exit      = 0o551,
	// find key 
	Find      = 0o552,
	// help key 
	Help      = 0o553,
	// mark key 
	Mark      = 0o554,
	// message key 
	Message   = 0o555,
	// move key 
	Move      = 0o556,
	// next key 
	Next      = 0o557,
	// open key 
	Open      = 0o560,
	// options key 
	Options   = 0o561,
	// previous key 
	Previous  = 0o562,
	// redo key 
	Redo      = 0o563,
	// reference key 
	Reference = 0o564,
	// refresh key 
	Refresh   = 0o565,
	// replace key 
	Replace   = 0o566,
	// restart key 
	Restart   = 0o567,
	// resume key 
	Resume    = 0o570,
	// save key 
	Save      = 0o571,
	// shifted begin key 
	SBeg      = 0o572,
	// shifted cancel key 
	SCancel   = 0o573,
	// shifted command key 
	SCommand  = 0o574,
	// shifted copy key 
	SCopy     = 0o575,
	// shifted create key 
	SCreate   = 0o576,
	// shifted delete-character key 
	SDC       = 0o577,
	// shifted delete-line key 
	SDL       = 0o600,
	// select key 
	Select    = 0o601,
	// shifted end key 
	Send      = 0o602,
	// shifted clear-to-end-of-line key 
	SEOL      = 0o603,
	// shifted exit key 
	SExit     = 0o604,
	// shifted find key 
	SFind     = 0o605,
	// shifted help key 
	SHelp     = 0o606,
	// shifted home key 
	SHome     = 0o607,
	// shifted insert-character key 
	SIC       = 0o610,
	// shifted left-arrow key 
	SLeft     = 0o611,
	// shifted message key 
	SMessage  = 0o612,
	// shifted move key 
	SMove     = 0o613,
	// shifted next key 
	SNext     = 0o614,
	// shifted options key 
	SOptions  = 0o615,
	// shifted previous key 
	SPrevious = 0o616,
	// shifted print key 
	SPrint    = 0o617,
	// shifted redo key 
	SRedo     = 0o620,
	// shifted replace key 
	SReplace  = 0o621,
	// shifted right-arrow key 
	SRight    = 0o622,
	// shifted resume key 
	SResume   = 0o623,
	// shifted save key 
	SSave     = 0o624,
	// shifted suspend key 
	SSuspend  = 0o625,
	// shifted undo key 
	SUndo     = 0o626,
	// suspend key 
	Suspend   = 0o627,
	// undo key 
	Undo      = 0o630,
	// Mouse event has occurred 
	Mouse     = 0o631,
	// Terminal resize event 
	Resize    = 0o632,
	// Maximum key value is 0632 
	Max       = 0o777,
}
