package ncurses

import "core:c"
foreign import ncurses "system:ncurses"

foreign ncurses {

	// Enables the terminal's keypad. 
	// If enabled, the user can press a function key (such as an arrow key) and wgetch returns a single value representing the function key, as in KEY_LEFT.
	//
	// If disabled, curses does not treat function keys specially and the program has to interpret the escape sequences itself.
	//
	// If the keypad in the terminal can be turned on (made to transmit) and off (made to work locally), turning on this option causes the terminal keypad to be turned on when wgetch is called.
	// The default value for keypad is false. 
	keypad :: proc(win: ^Window, enable: bool) -> c.int ---

	// --- INPUT

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


	// --- OUTPUT 

	printw :: proc(fmt: cstring, #c_vararg args: ..any) -> c.int ---
	wprintw :: proc(win: ^Window, fmt: cstring, #c_vararg args: ..any) -> c.int ---
	mvprintw :: proc(y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---
	mvwprintw :: proc(win: ^Window, y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---

	addch :: proc(char: c.uint) -> c.int ---
	waddch :: proc(win: ^Window, char: c.uint) -> c.int ---
	mvaddch :: proc(y, x: c.int, char: c.uint) -> c.int ---
	mvwaddch :: proc(win: ^Window, y, x: c.int, char: c.uint) -> c.int ---

	delch :: proc() -> c.int ---
	wdelch :: proc(win: ^Window) -> c.int ---
	mvdelch :: proc(y, x: c.int) -> c.int ---
	mvwdelch :: proc(win: ^Window, y, x: c.int) -> c.int ---

	addstr :: proc(str: cstring) -> c.int ---
	waddstr :: proc(win: ^Window, str: cstring) -> c.int ---
	mvaddstr :: proc(y, x: c.int, str: cstring) -> c.int ---
	mvwaddstr :: proc(win: ^Window, y, x: c.int, str: cstring) -> c.int ---

	move :: proc(y, x: c.int) -> c.int ---
	wmove :: proc(win: ^Window, y, x: c.int) ---

	// Returns a character string corresponding to the key c:
	//
	// - Printable characters are displayed as themselves, e.g., a one-character string containing the key.
	// - Control characters are displayed in the ^X notation.
	// - DEL (character 127) is displayed as ^?.
	// - Values above 128 are either meta characters (if the screen has not been initialized, or if meta has been called with a TRUE parameter), shown in the M-X notation, or are displayed as themselves. In the latter case, the values may not be printable; this follows the X/Open specification.
	// - Values above 256 may be the names of the names of function keys.
	// - Otherwise (if there is no corresponding name) the function returns null, to denote an error. X/Open also lists an "UNKNOWN KEY" return value, which some implementations return rather than null. 
	keyname :: proc(c: c.int) -> cstring ---
}

// down-arrow key 
KEY_DOWN :: 0o402
// up-arrow key 
KEY_UP :: 0o403
// left-arrow key 
KEY_LEFT :: 0o404
// right-arrow key 
KEY_RIGHT :: 0o405
// home key 
KEY_HOME :: 0o406
// backspace key 
KEY_BACKSPACE :: 0o407
// Function keys.  Space for 64 
KEY_F0 :: 0o410
KEY_F1 :: 0o411
KEY_F2 :: 0o412
KEY_F3 :: 0o413
KEY_F4 :: 0o414
KEY_F5 :: 0o415
KEY_F6 :: 0o416
KEY_F7 :: 0o417
KEY_F8 :: 0o420
KEY_F9 :: 0o421
KEY_F10 :: 0o422
KEY_F11 :: 0o423
KEY_F12 :: 0o424
KEY_F :: #force_inline proc(n: c.int) -> c.int {
	return c.int(KEY_F0) + n
}
// delete-line key 
KEY_DL :: 0o510
// insert-line key 
KEY_IL :: 0o511
// delete-character key 
KEY_DC :: 0o512
// insert-character key 
KEY_IC :: 0o513
// sent by rmir or smir in insert mode 
KEY_EIC :: 0o514
// clear-screen or erase key 
KEY_CLEAR :: 0o515
// clear-to-end-of-screen key 
KEY_EOS :: 0o516
// clear-to-end-of-line key 
KEY_EOL :: 0o517
// scroll-forward key 
KEY_SF :: 0o520
// scroll-backward key 
KEY_SR :: 0o521
// next-page key 
KEY_NPAGE :: 0o522
// previous-page key 
KEY_PPAGE :: 0o523
// set-tab key 
KEY_STAB :: 0o524
// clear-tab key 
KEY_CTAB :: 0o525
// clear-all-tabs key 
KEY_CATAB :: 0o526
// enter/send key 
KEY_ENTER :: 0o527
// print key 
KEY_PRINT :: 0o532
// lower-left key (home down) 
KEY_LL :: 0o533
// upper left of keypad 
KEY_A1 :: 0o534
// upper right of keypad 
KEY_A3 :: 0o535
// center of keypad 
KEY_B2 :: 0o536
// lower left of keypad 
KEY_C1 :: 0o537
// lower right of keypad 
KEY_C3 :: 0o540
// back-tab key 
KEY_BTAB :: 0o541
// begin key 
KEY_BEG :: 0o542
// cancel key 
KEY_CANCEL :: 0o543
// close key 
KEY_CLOSE :: 0o544
// command key 
KEY_COMMAND :: 0o545
// copy key 
KEY_COPY :: 0o546
// create key 
KEY_CREATE :: 0o547
// end key 
KEY_END :: 0o550
// exit key 
KEY_EXIT :: 0o551
// find key 
KEY_FIND :: 0o552
// help key 
KEY_HELP :: 0o553
// mark key 
KEY_MARK :: 0o554
// message key 
KEY_MESSAGE :: 0o555
// move key 
KEY_MOVE :: 0o556
// next key 
KEY_NEXT :: 0o557
// open key 
KEY_OPEN :: 0o560
// options key 
KEY_OPTIONS :: 0o561
// previous key 
KEY_PREVIOUS :: 0o562
// redo key 
KEY_REDO :: 0o563
// reference key 
KEY_REFERENCE :: 0o564
// refresh key 
KEY_REFRESH :: 0o565
// replace key 
KEY_REPLACE :: 0o566
// restart key 
KEY_RESTART :: 0o567
// resume key 
KEY_RESUME :: 0o570
// save key 
KEY_SAVE :: 0o571
// shifted begin key 
KEY_SBEG :: 0o572
// shifted cancel key 
KEY_SCANCEL :: 0o573
// shifted command key 
KEY_SCOMMAND :: 0o574
// shifted copy key 
KEY_SCOPY :: 0o575
// shifted create key 
KEY_SCREATE :: 0o576
// shifted delete-character key 
KEY_SDC :: 0o577
// shifted delete-line key 
KEY_SDL :: 0o600
// select key 
KEY_SELECT :: 0o601
// shifted end key 
KEY_SEND :: 0o602
// shifted clear-to-end-of-line key 
KEY_SEOL :: 0o603
// shifted exit key 
KEY_SEXIT :: 0o604
// shifted find key 
KEY_SFIND :: 0o605
// shifted help key 
KEY_SHELP :: 0o606
// shifted home key 
KEY_SHOME :: 0o607
// shifted insert-character key 
KEY_SIC :: 0o610
// shifted left-arrow key 
KEY_SLEFT :: 0o611
// shifted message key 
KEY_SMESSAGE :: 0o612
// shifted move key 
KEY_SMOVE :: 0o613
// shifted next key 
KEY_SNEXT :: 0o614
// shifted options key 
KEY_SOPTIONS :: 0o615
// shifted previous key 
KEY_SPREVIOUS :: 0o616
// shifted print key 
KEY_SPRINT :: 0o617
// shifted redo key 
KEY_SREDO :: 0o620
// shifted replace key 
KEY_SREPLACE :: 0o621
// shifted right-arrow key 
KEY_SRIGHT :: 0o622
// shifted resume key 
KEY_SRESUME :: 0o623
// shifted save key 
KEY_SSAVE :: 0o624
// shifted suspend key 
KEY_SSUSPEND :: 0o625
// shifted undo key 
KEY_SUNDO :: 0o626
// suspend key 
KEY_SUSPEND :: 0o627
// undo key 
KEY_UNDO :: 0o630
// Mouse event has occurred 
KEY_MOUSE :: 0o631
// Terminal resize event 
KEY_RESIZE :: 0o632
// Maximum key value is 0632 
KEY_MAX :: 0o777

