#! /usr/bin/env python3.6

import re, sys, common

def parse_args():
    from argparse import ArgumentParser
    p = ArgumentParser()
    p.add_argument('regex', nargs='?')
    args = vars(p.parse_args())
    return args['regex']


if __name__ == "__main__":
    stdin = common.read_pipe()

    regex = parse_args()
    if regex is None:
        print(stdin)
        sys.exit(0)

    if '(' not in regex:
        regex = '(%s)' % regex


    try:
        print(re.search(regex, stdin).group(1))
    except AttributeError as e:
        pass