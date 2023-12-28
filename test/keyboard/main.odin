// adapted from: https://tldp.org/HOWTO/NCURSES-Programming-HOWTO/keys.html
package keyboard

import nc "../../src"
import "core:c"

WIDTH :: 30
HEIGHT :: 10

choices := [?]cstring{"Choice 1", "Choice 2", "Choice 3", "Choice 4", "Exit"}

main :: proc() {
	nc.initscr()
	nc.clear()
	nc.noecho()
	nc.cbreak() // Line buffering disabled. pass on everything

	startx: c.int = (80 - WIDTH) / 2
	starty: c.int = (24 - HEIGHT) / 2
	menu_win := nc.newwin(HEIGHT, WIDTH, starty, startx)
	highlight := 1
	choice := 0
	char: c.int

	nc.keypad(menu_win, true)
	nc.mvprintw(0, 0, "Use arrow keys to go up and down, Press enter to select a choice")
	nc.refresh()
	print_menu(menu_win, highlight)

	for {
		char = nc.wgetch(menu_win)
		switch char {
		case nc.KEY_UP:
			if highlight == 1 {
				highlight = len(choices)
			} else {
				highlight -= 1
			}
		case nc.KEY_DOWN:
			if highlight == len(choices) {
				highlight = 1
			} else {
				highlight += 1
			}
		case 10:
			choice = highlight
		case:
			nc.mvprintw(
				24,
				0,
				"Charcter pressed is = %3d Hopefully it can be printed as '%c'",
				char,
				char,
			)
			nc.refresh()
		}

		print_menu(menu_win, highlight)
		if (choice != 0) {
			/* User did a choice come out of the infinite loop */
			break
		}
	}
	nc.mvprintw(23, 0, "You chose choice %d with choice string %s\n", choice, choices[choice - 1])
	nc.clrtoeol()
	nc.refresh()
	nc.endwin()
}


print_menu :: proc(menu_win: ^nc.Window, highlight: int) {
	x: c.int = 2
	y: c.int = 2
	nc.box(menu_win, 0, 0)

	for i in 0 ..< len(choices) {
		// High light the present choice 
		if (highlight == i + 1) {
			nc.wattron(menu_win, nc.A_REVERSE)
			nc.mvwprintw(menu_win, y, x, "%s", choices[i])
			nc.wattroff(menu_win, nc.A_REVERSE)
		} else {
			nc.mvwprintw(menu_win, y, x, "%s", choices[i])
		}
		y += 1
	}
	nc.wrefresh(menu_win)
}
