package main

import ncurses "../src"

main :: proc() {
	ncurses.initscr()
	ncurses.cbreak()
	defer ncurses.endwin()
	italic, bold: bool
	for {
		ncurses.mvprintw(10, 10, "Hello World")
		ncurses.refresh()
		c := ncurses.getch()

		if c == 'b' {
			if bold {
				ncurses.attroff(ncurses.A_BOLD)
			} else {
				ncurses.attron(ncurses.A_BOLD)
			}
			bold = !bold
		}

		if c == 'i' {
			if italic {
				ncurses.attroff(ncurses.A_ITALIC)
			} else {
				ncurses.attron(ncurses.A_ITALIC)
			}
			italic = !italic
		}

		if c == 'q' {
			break
		}
	}
}
