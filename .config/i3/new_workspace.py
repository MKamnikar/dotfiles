#! /usr/bin/env python2

# Read the JSON representation of the list of workspaces, get the focused
# workspace and open the first empty workspace available on the same output.
# We convert JSON directly to Python data by exploiting the similar syntax,
# we just need to convert "true" and "false" to "True" and "False". This is
# kind of a hack but it works fine for this short script.

import subprocess
import argparse
import sys
from operator import itemgetter
import ast
import re

# Parse arguments.
parser = argparse.ArgumentParser(
    description="Launch a new i3 workspace on the active output.",
    epilog="Designed to run on a dual-monitor setup with odd workspaces "
    "on the left and even workspaces on the right.")
# Fill holes in the numbering.
parser.add_argument("-f", "--fill-holes", action="store_true",
                    help="Fill holes in the workspace numbering on the active "
                    "output [Default: False]")
args = parser.parse_args()

try:
    # Detect if user is running single- or multi-screen config.
    screens = subprocess.check_output(["i3-msg", "-t", "get_outputs"])
except subprocess.CalledProcessError as e:
    # Print the error and exit.
    print(e.output)
    print("Could not get number of active monitors from xrandr. Aborting...")
    sys.exit(1)


try:
    line = subprocess.check_output(["i3-msg", "-t", "get_workspaces"])
except subprocess.CalledProcessError as e:
    # Print the error and exit.
    print(e.output)
    print("Could not get list of workspaces from i3-msg. Aborting...")
    sys.exit(1)

# Replace "false"/"true" with "False"/"True" to "convert" JSON to Python.
workspaces_str = line.replace("false", "False").replace("true", "True")
# Safely evaluate the data expression. Get a sorted list of workspaces.
workspaces = sorted(ast.literal_eval(workspaces_str), key=itemgetter("num"))
workspace_nos = [w["num"] for w in workspaces]

# Find out if user is using multi-monitor setup.
# screens contains info about active outputs - find out how many.
# It is expected that user is using 1 or 2 screens.
# -1 is for it to become 0 or 1 (bool).
dual_monitor = len(re.findall(r'"active":true,', str(screens))) - 1

# Find the focused workspace and save its output.
for w in workspaces:
    if w["focused"]:
        focused_output = w["output"]
        focused_workspace = w["num"]
        break

if not dual_monitor:  # if single-monitor
    if args.fill_holes:
        # Find the lowest free workspace on the focused output.
        # Find the lowest workspace on the focused output.
        # Begin with one and search until you find non-taken workspace number.
        new = 1
        # While the workspace number is taken, increment it by 1.
        while new in workspace_nos:
            new += 1  # this is modified for a single monitor.
    else:
        # Find the highest workspace on the focused output and increase it by
        # 1.
        highest = 0
        for w in workspaces:
            if w["output"] == focused_output and w["num"] > highest:
                highest = w["num"]
        new = highest + 1
else:  # if dual-monitor
    if args.fill_holes:
        # Find the lowest free workspace on the focused output.
        # Find the lowest workspace on the focused output.
        new = focused_workspace % 2
        # Workspaces start from 1, not from 0.
        if new == 0:
            new = 2
        # While the workspace number is taken, increment it by 2.
        while new in workspace_nos:
            new += 2
    else:
        # Find the highest workspace on the focused output and increase it by
        # 2.
        highest = 0
        for w in workspaces:
            if w["output"] == focused_output and w["num"] > highest:
                highest = w["num"]
        new = highest + 2

try:
    subprocess.check_call(["i3-msg", "workspace", str(new)])
except subprocess.CalledProcessError as e:
    # Print the error and exit.
    print(e)
    print("Could not open workspace {}. Aborting...".format(new))
    sys.exit(1)
