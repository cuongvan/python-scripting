## myip: show the ip address

Usage: `myip`

Outputs: `192.168.100.16`

## mem: show simple memory usage

Usage: `mem`

Outputs:

    `2377 / 5858 MB (41%)`

## re: extract text from stdin

Usage: `re <pattern>`

If the pattern does not contains grouping parentheses...

Examples:
```bash
    echo vantiencuong | re cuong # cuong
    echo 100:200 | re '(\d+)'    # 100
    echo 100:200 | re ':(\d+)'   # 200
```

## x: a simple version of xargs

Usage: quite silimar to xargs

Examples:

```bash
    echo hello world | x echo       # echo hello world
    echo 5000 | x curl localhost:@  # curl localhost:5000
    echo cuong | x -d + curl localhost/+@gmail.com # curl localhost/cuong@gmail.com
```

## loop: run a command n times

Usage: `loop n <cmd>`

Examples:
```bash
    loop 100 echo 1
```

I often use this to generate load on a http server for testing.
```bash
    loop 100 http localhost:5000
```
