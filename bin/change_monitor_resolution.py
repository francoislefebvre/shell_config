#! /usr/bin/python

import os
import re
import sys
import subprocess
from collections import namedtuple

setup = {}

class Resolution(object):
    def __init__(self, name, up, down):
        self.name = name
        self.up = up
        self.down = down

    def __str__(self):
        return self.name


def read_setup():
    p = subprocess.Popen(
        ['xrandr'],
        stdout=subprocess.PIPE)

    lines, junk = p.communicate()

    for line in lines.split('\n'):
        monitor_match = re.match('(\w+) connected', line)
        name = monitor_match.group(1) if monitor_match else None
        if name:
            setup[name] = {'current': None, 'resolutions': {}}
            last_resolution = None
            parsing = name
            continue

        res_match = re.match('   ((\d+)x(\d+))[^\*]+(\*)?', line)
        res_name, width, height, is_current = res_match.groups() if res_match else 4 * (None,)

        if not res_name:
            continue

        if is_current:
            setup[parsing]['current'] = res_name

        ratio = float(width) / float(height)

        if 1.7 < ratio < 1.8:
            res = Resolution(res_name, last_resolution, None)
            if last_resolution:
                last_resolution.down = res
            setup[parsing]['resolutions'][res_name] = res
            last_resolution = res


def change_resolution(direction):
    for monitor in setup:
        current = setup[monitor]['current']
        target_res = getattr(setup[monitor]['resolutions'][current], direction)
        if target_res:
            command = 'xrandr --output {} --mode {}'.format(monitor, target_res)
            os.system(command)

if __name__ == '__main__':
    read_setup()
    try:
        change_resolution(sys.argv[1])
    except IndexError:
        raise Exception('Must give direction up or down.')

