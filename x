#! /usr/bin/env python3.6

import sys, common, subprocess

def fill_param(cmd: list, delim, param):
    cmd_ = cmd.copy()
    filled = False
    for i, x in enumerate(cmd):
        if delim in x:
            cmd_[i] = x.replace(delim, param)
            filled = True
    if not filled:
        cmd_.append(param) # add to last
    return cmd_

def parse_args():
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument('-d', '--delim', default='@')
    p.add_argument('cmd', nargs='*')
    args = vars(p.parse_args())
    return args['delim'], args['cmd']


if __name__ == "__main__":
    delim, cmd = parse_args()
    if len(cmd) == 0:
        sys.exit(0)

    stdin = common.read_pipe()
    args = stdin.split()

    for a in args:
        filled =  fill_param(cmd, delim, a)
        subprocess.call(filled)
        