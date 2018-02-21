#! /usr/bin/python

import os
import re
import sys
import json
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
    lines = subprocess.check_output(['xrandr'])

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
    if direction == 'current':
        for monitor in monitors:
            print monitor, setup[monitor]['current']
    else:
        focused_monitor = None
        try:
            workspaces = json.loads(
                subprocess.check_output('i3-msg -t get_workspaces', shell=True))
            for workspace in workspaces:
                if workspace['focused']:
                    focused_monitor = workspace['output']
                    break
        except subprocess.CalledProcessError:
            pass
        monitors = [focused_monitor] if focused_monitor else setup
        command = ' '.join(['xrandr'] + get_monitor_options(focused_monitor, direction))
        os.system(command)


def get_monitor_options(focused_monitor, direction):
    monitor_options = []
    for monitor in setup:
        if focused_monitor and monitor != focused_monitor:
            resolution_name = setup[monitor]['current']
        else:
            current = setup[monitor]['current']
            resolution_name = getattr(
                setup[monitor]['resolutions'][current], direction)
        monitor_options.append(
            get_option(monitor, resolution_name))
    return monitor_options


def get_option(monitor_name, resolution_name):
    return '--output {} --mode {}'.format(
        monitor_name,
        resolution_name)


if __name__ == '__main__':
    read_setup()
    try:
        change_resolution(sys.argv[1])
    except IndexError:
        raise Exception('Must give direction up or down.')

