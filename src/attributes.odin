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
WA_ITALIC := A_ITALIC /* ncurses extension */

Color :: enum c.int {
	Black   = 0,
	Red     = 1,
	Green   = 2,
	Yellow  = 3,
	Blue    = 4,
	Magenta = 5,
	Cyan    = 6,
	White   = 7,
}

foreign ncurses {
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

	init_color :: proc(color, r, g, b: c.short) -> c.int ---
	init_pair :: proc(pair_id, fg, bg: c.short) -> c.int ---
	has_colors :: proc() -> c.bool ---
	start_color :: proc() -> c.int ---
	use_default_colors :: proc() -> c.int ---
	COLOR_PAIR :: proc(pair_id: c.int) -> c.int ---
}
