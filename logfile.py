import time

def empty_file(filename):
    """Continuously empties the contents of a file every second without deleting it."""
    while True:
        # Open the file in write mode to truncate it (empty it)
        with open(filename, 'w'):
            pass
        # Wait for 1 second before emptying it again
        time.sleep(1)

# Replace 'path/to/your/file.log' with the path to your log file
empty_file('openlane/summer_school_mpd_wrapper/runs/24_11_13_12_50/logs/synthesis/1-synthesis.log')