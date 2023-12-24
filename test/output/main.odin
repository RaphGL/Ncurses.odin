// adapted from https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/printw.html
package output

import nc "../../src"

main :: proc() {
	nc.initscr()
	nc.noecho()
	nc.cbreak()
	msg :: "Just a string"
	for {
		nc.erase()

		// get the number of rows and columns
		y, x := nc.getmaxyx(nc.stdscr)
		// print the message at the center of the screen
		nc.mvprintw(y / 2, (x - len(msg)) / 2, "%s", msg)
		nc.mvprintw(y - 2, 0, "This screen has %d rows and %d columns\n", y, x)
		nc.printw("Try resizing your window. Press 'q' to quit.")
		nc.refresh()

		if nc.getch() == 'q' {
			break
		}
	}

	nc.endwin()
}
