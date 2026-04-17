#!/usr/bin/env python3
import subprocess
import time
  #pls rewrite this after learnig python :3
TIMEOUT = 300  # 5 minutes
COMMAND = ["bash", "~/startss.sh"]  # change this

CHECK_INTERVAL = 1  # seconds


def get_idle_time():
    """Returns idle time in seconds using xprintidle."""
    try:
        ms = int(subprocess.check_output(["xprintidle"]).strip())
        return ms / 1000.0
    except Exception:
        return 0


def is_vlc_playing():
    """Returns True if VLC is actively playing."""
    try:
        status = subprocess.check_output(
            ["playerctl", "-p", "vlc", "status"],
            stderr=subprocess.DEVNULL
        ).decode().strip()
        return status == "Playing"
    except Exception:
        return False


def run_command():
    subprocess.Popen(COMMAND)


def main():
    timer_start = time.time()

    while True:
        idle = get_idle_time()

        if is_vlc_playing():
            # Pause/reset timer while VLC is playing
            timer_start = time.time()
        else:
            # Reset timer if user pressed a key (idle < 1 sec)
            if idle < CHECK_INTERVAL:
                timer_start = time.time()

        elapsed = time.time() - timer_start

        if elapsed >= TIMEOUT:
            run_command()
            timer_start = time.time()

        time.sleep(CHECK_INTERVAL)


if __name__ == "__main__":
    main()
