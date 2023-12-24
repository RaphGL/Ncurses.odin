// adapted from: https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/windows.html
package window

import nc "../../src"
import "core:c"

create_window :: proc(h, w, y, x: c.int) -> ^nc.Window {
	local_win := nc.newwin(h, w, y, x)
	nc.box(local_win, 0, 0)
	nc.wrefresh(local_win)
	return local_win
}

destroy_window :: proc(win: ^nc.Window) {
	nc.wborder(win, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ')
	nc.wrefresh(win)
	nc.delwin(win)
}

main :: proc() {
	nc.initscr()
	nc.cbreak()
	nc.noecho()
	nc.keypad(nc.stdscr, true)
	nc.curs_set(0)
	nc.printw("Press Q to quit and WASD/Arrows keys to move")
	nc.refresh()

	x, y: c.int = 10, 10
	h, w: c.int = 3, 10
	win := create_window(h, w, y, x)

	for ch := nc.getch(); ch != 'q'; ch = nc.getch() {
		switch ch {
		case 'w', c.int(nc.Key.Up):
			y -= 1
		case 'a', c.int(nc.Key.Left):
			x -= 1
		case 's', c.int(nc.Key.Down):
			y += 1
		case 'd', c.int(nc.Key.Right):
			x += 1
		}

		destroy_window(win)
		win = create_window(h, w, y, x)
	}

	nc.endwin()
}
