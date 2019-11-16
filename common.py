
def align_width(lines):
    lens = [len(l) for l, r in lines]
    max_w_left = max(lens)
    for left, right in lines:
        print(str(left).ljust(max_w_left) + ' : ' + str(right))

def read_pipe():
    import select, sys, os
    is_pipe = lambda: not os.isatty(sys.stdin.fileno())
    if is_pipe():
        return sys.stdin.read()
    else:
        sys.exit('Only works with pipe')