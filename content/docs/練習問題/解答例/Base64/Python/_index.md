---
title: "Python"
date: 2026-07-01T14:15:47+09:00
lastmod: 2026-07-01T14:15:47+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

```
#!/usr/bin/python
import sys
from string import ascii_lowercase, ascii_uppercase, digits

table = ascii_uppercase + ascii_lowercase + digits + '+/'

def encode(filename):
    with open(filename, 'rb') as f:
        return _e(f.read())
    
def decode(filename):
    with open(filename, 'r') as f:
        return _d(f.read())

def _e(byte_arr):
    bit = ''.join(f"{b:08b}" for b in byte_arr)
    n_extra = -len(bit)%6
    bit += '0' * n_extra
    res = ''.join(table[int(bit[i:i+6], 2)] for i in range(0, len(bit), 6))
    return res + '=' * (-len(res) % 4)

def _d(b64str):
    bit = ''.join(f"{table.find(c):06b}" for c in b64str if c in table)
    n_extra = len(bit)%8
    bit = bit[0:len(bit)-n_extra]
    res = bytes(int(bit[i:i+8], 2) for i in range(0, len(bit), 8))
    return res

def help_n_exit():
    print(f"""\
usage: python my_base64.py option filename

option:
  -e : encode binary file to Base64 string
  -d : decode Base64 file to binary string

example:
  encode: b'VIP de programming' -> {_e(b"VIP de programming")}
  decode: VklQIGRlIHByb2dyYW1taW5n -> {_d("VklQIGRlIHByb2dyYW1taW5n")}\
""")
    exit()
    
if len(sys.argv) < 3:
    help_n_exit()
    
option = sys.argv[1]
if option == '-e':
    encoded = encode(sys.argv[2])
    W = 76
    res = '\n'.join(encoded[i:i+W] for i in range(0, len(encoded), W))
    print(res)
elif option == '-d':
    decoded = decode(sys.argv[2])
    sys.stdout.buffer.write(decoded)
else:
    help_n_exit()
```
