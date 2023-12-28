package colors

import nc "../../src"
import "core:c"

main :: proc() {
	nc.initscr()
	nc.noecho()
	nc.cbreak()
	nc.use_default_colors()
	color_support := nc.has_colors()
	defer nc.endwin()
	if color_support {
		nc.start_color()
		nc.init_pair(1, nc.COLOR_RED, nc.COLOR_BLUE)
		nc.init_pair(2, nc.COLOR_BLUE, nc.COLOR_GREEN)
	}

	COLOR_1 := nc.COLOR_PAIR(1)
	COLOR_2 := nc.COLOR_PAIR(2)

	for {
		nc.mvprintw(0, 0, "Color Support: %s", "true" if color_support else "false")

		nc.attron(COLOR_1)
		nc.mvprintw(10, 10, "LOREM IPSUM")
		nc.attroff(COLOR_1)

		nc.attron(COLOR_2)
		nc.move(11, 10)
		nc.printw("LOREM IPSUM 2")
		nc.attroff(COLOR_2)

		nc.refresh()

		if nc.getch() == 'q' {
			break
		}
	}
}
