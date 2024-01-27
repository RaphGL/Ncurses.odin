package ncurses

import "core:c"

foreign import ncurses "system:ncurses"

OK: c.int : 0
ERR: c.int : -1

foreign ncurses {
	// Usually the first routine called when initializing a program.
	//
	// It determines the terminal type and initializes all ncurses data structures.
	// It internally calls the first refresh().
	//
	// Error: writes a message to stderr and exit
	// Success: returns stdscr
	initscr :: proc() -> ^Window ---

	// Use halfdelay mode.
	//
	// Similar to cbreak(), however after tenths of seconds
	// have passed an ERR is returned if nothing was typed.
	halfdelay :: proc(tenths: c.int) -> c.int ---

	// Copies the stdscr to the physical terminal screen.
	refresh :: proc() -> c.int ---
	// Copies the specified window to the physical terminal screen.
	wrefresh :: proc(win: ^Window) -> c.int ---

	// All allocated resources from ncurses are cleaned up and the tty modes are restored to the status they had before calling initscr().
	endwin :: proc() -> c.int ---

	// Place the terminal into raw mode.
	//
	// Raw mode is similar to cbreak mode, in that characters typed are immediately passed through to the user program.
	// The differences are that in raw mode, the interrupt, quit, suspend, and flow control characters are all passed through uninterpreted, instead of generating a signal.
	// The behavior of the BREAK key depends on other bits in the tty driver that are not set by curses. 
	raw :: proc() -> c.int ---
	// Place the terminal out of raw mode.
	//
	// Raw mode is similar to cbreak mode, in that characters typed are immediately passed through to the user program.
	// The differences are that in raw mode, the interrupt, quit, suspend, and flow control characters are all passed through uninterpreted, instead of generating a signal.
	// The behavior of the BREAK key depends on other bits in the tty driver that are not set by curses. 
	noraw :: proc() -> c.int ---

	// Disables line buffering and erase/kill character-processing (interrupt and flow control characters are unaffected),
	// making characters typed by the user immediately available to the program.
	cbreak :: proc() -> c.int ---
	// Returns the terminal to normal (cooked) mode.
	nocbreak :: proc() -> c.int ---

	// Show typed characters when user when using getch.
	echo :: proc() -> c.int ---
	// Hide typed characters when user when using getch.
	noecho :: proc() -> c.int ---

	// Set the cursor's visibility.
	//
	// Visibility modes:
	//	 0: invisible
	//	 1: normal
	//	 2: very visible
	//
	// Success: Returns previous cursor state
	// Error: Returns ERR
	curs_set :: proc(visibility: c.int) -> c.int ---
}
