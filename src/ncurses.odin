package ncurses

import "core:c"

foreign import ncurses "system:ncurses"

@(private="file")
_win_st :: struct {}
Window :: _win_st

foreign ncurses {
    initscr :: proc() -> ^Window ---
    keypad :: proc(win: ^Window, enable: bool) -> c.int ---
    halfdelay :: proc(timeout: c.int) -> c.int ---

    printw :: proc(fmt: cstring, #c_vararg args: ..any) -> c.int ---
    wprintw :: proc(win: ^Window, fmt: cstring, #c_vararg args: ..any) -> c.int ---
    mvprintw :: proc(y: c.int, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---
    mvwprintw :: proc(win: ^Window, y, x: c.int, fmt: cstring, #c_vararg args: ..any) -> c.int ---

    move :: proc(y, x: c.int) -> c.int ---
    wmove :: proc(win: ^Window, y, x: c.int) ---

    refresh :: proc() -> c.int ---
    wrefresh :: proc(win: ^Window) -> c.int ---

    getch :: proc() -> c.int ---
    endwin :: proc() -> c.int ---

    raw :: proc() -> c.int ---
    noraw :: proc() -> c.int ---

    cbreak :: proc() -> c.int ---
    nocbreak :: proc() -> c.int ---

    echo :: proc() -> c.int ---
    noecho :: proc() -> c.int ---
}