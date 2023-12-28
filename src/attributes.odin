package ncurses

import "core:c"
foreign import ncurses "system:ncurses"

@(private)
NCURSES_ATTR_SHIFT :: 8

@(private = "file")
ncurses_bits :: #force_inline proc(mask, shift: c.uint) -> c.int {
	return c.int(mask << (shift + NCURSES_ATTR_SHIFT))
}

// -- Attributes

A_NORMAL := c.int(c.uint(1) - c.uint(1))
A_ATTRIBUTES := ncurses_bits(~(c.uint(1) - c.uint(1)), 0)
A_CHARTEXT := ncurses_bits(1, 0) - 1
A_COLOR := ncurses_bits((c.uint(1) << 8) - c.uint(1), 0)
A_STANDOUT := ncurses_bits(1, 8)
A_UNDERLINE := ncurses_bits(1, 9)
A_REVERSE := ncurses_bits(1, 10)
A_BLINK := ncurses_bits(1, 11)
A_DIM := ncurses_bits(1, 12)
A_BOLD := ncurses_bits(1, 13)
A_ALTCHARSET := ncurses_bits(1, 14)
A_INVIS := ncurses_bits(1, 15)
A_PROTECT := ncurses_bits(1, 16)
A_HORIZONTAL := ncurses_bits(1, 17)
A_LEFT := ncurses_bits(1, 18)
A_LOW := ncurses_bits(1, 19)
A_RIGHT := ncurses_bits(1, 20)
A_TOP := ncurses_bits(1, 21)
A_VERTICAL := ncurses_bits(1, 22)
A_ITALIC := ncurses_bits(1, 23) /* ncurses extension */

// -- X/Open Attributes
// They're equivalent to the A_ attributes on ncurses

WA_ATTRIBUTES := A_ATTRIBUTES
WA_NORMAL := A_NORMAL
WA_STANDOUT := A_STANDOUT
WA_UNDERLINE := A_UNDERLINE
WA_REVERSE := A_REVERSE
WA_BLINK := A_BLINK
WA_DIM := A_DIM
WA_BOLD := A_BOLD
WA_ALTCHARSET := A_ALTCHARSET
WA_INVIS := A_INVIS
WA_PROTECT := A_PROTECT
WA_HORIZONTAL := A_HORIZONTAL
WA_LEFT := A_LEFT
WA_LOW := A_LOW
WA_RIGHT := A_RIGHT
WA_TOP := A_TOP
WA_VERTICAL := A_VERTICAL
WA_ITALIC := A_ITALIC

COLOR_BLACK   :: 0
COLOR_RED     :: 1
COLOR_GREEN   :: 2
COLOR_YELLOW  :: 3
COLOR_BLUE    :: 4
COLOR_MAGENTA :: 5
COLOR_CYAN    :: 6
COLOR_WHITE   :: 7

foreign ncurses {
	// Maximum number of colors.
	COLORS: c.int
	// Maximum number of color-pairs.
	COLORS_PAIRS: c.int

	attron :: proc(attr: c.int) -> c.int ---
	attroff :: proc(attr: c.int) -> c.int ---
	attrset :: proc(attr: c.int) -> c.int ---
	wattron :: proc(win: ^Window, attr: c.int) -> c.int ---
	wattroff :: proc(win: ^Window, attr: c.int) -> c.int ---
	wattrset :: proc(win: ^Window, attr: c.int) -> c.int ---

	attr_on :: proc() --- // TODO
	attr_off :: proc() --- // TODO
	attr_set :: proc() --- // TODO
	wattr_on :: proc() --- // TODO
	wattr_off :: proc() --- // TODO
	wattr_set :: proc() --- // TODO

	// changes the definition of a color. It takes four arguments:
	//  the number of the color to be changed followed by three RGB values (for the amounts of red, green, and blue components).
	//
	// The value of the first argument must be between 0 and COLORS. (See the section Colors for the default color index.)
	// Each of the last three arguments must be a value between 0 and 1000. 
	// When init_color is used, all occurrences of that color on the screen immediately change to the new definition. 
	init_color :: proc(color, r, g, b: c.short) -> c.int ---
	// Changes the definition of a color-pair. 
	// It takes three arguments: the number of the color-pair to be changed, the foreground color number, and the background color number. 
	// For portable applications:
	//
	// - The value of the first argument must be between 1 and COLOR_PAIRS-1, except that if default colors are used (see use_default_colors) 
	// the upper limit is adjusted to allow for extra pairs which use a default color in foreground and/or background.
	//
	// - The value of the second and third arguments must be between 0 and COLORS. Color pair 0 is assumed to be white on black,
	// but is actually whatever the terminal implements before color is initialized. It cannot be modified by the application.
	// If the color-pair was previously initialized, the screen is refreshed and all occurrences of that color-pair are changed to the new definition.
	//
	// As an extension, ncurses allows you to set color pair 0 via the assume_default_colors routine, 
	// or to specify the use of default colors (color number -1) if you first invoke the use_default_colors routine. 
	init_pair :: proc(pair_id, fg, bg: c.short) -> c.int ---
	has_colors :: proc() -> c.bool ---
	// Must be called if the programmer wants to use colors, and before any other color manipulation routine is called. 
	// It is good practice to call this routine right after initscr.
	//
	// start_color initializes eight basic colors (black, red, green, yellow, blue, magenta, cyan, and white), 
	// and two global variables, COLORS and COLOR_PAIRS (respectively defining the maximum number of colors and color-pairs the terminal can support).
	// It also restores the colors on the terminal to the values they had when the terminal was just turned on. 
	start_color :: proc() -> c.int ---
	use_default_colors :: proc() -> c.int ---
	assume_default_colors :: proc(fg, bg: c.int) -> c.int ---
	COLOR_PAIR :: proc(pair_id: c.int) -> c.int ---
}
