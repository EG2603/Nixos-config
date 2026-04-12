import curses
import subprocess

menu = [
    ("Start X11", ["startx"]),
    ("Chromium", ["chromium", "--start-fullscreen"]),
    ("VLC", ["vlc", "--fullscreen"]),
    ("KWrite", ["kwrite"]),
    ("MSedit", ["msedit"]),
    ("Poweroff", ["shutdown", "now"])
]

def main(stdscr):
    curses.curs_set(0)
    h, w = stdscr.getmaxyx()
    selected = 0

    while True:
        stdscr.clear()
        title = "Fallback Menu"
        stdscr.addstr(1, (w - len(title)) // 2, title, curses.A_BOLD)

        for i, (label, cmd) in enumerate(menu):
            x = 3 + i
            if i == selected:
                stdscr.addstr(x, 4, "> " + label, curses.A_REVERSE)
            else:
                stdscr.addstr(x, 4, "  " + label)

        key = stdscr.getch()

        if key == curses.KEY_UP:
            selected = (selected - 1) % len(menu)
        elif key == curses.KEY_DOWN:
            selected = (selected + 1) % len(menu)
        elif key in (curses.KEY_ENTER, 10, 13):
            subprocess.Popen(menu[selected][1])
        elif key == 27:  # ESC
            break

        stdscr.refresh()

curses.wrapper(main)
