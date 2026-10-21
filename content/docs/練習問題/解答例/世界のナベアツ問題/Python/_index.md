---
title: "Python"
date: 2026-07-04T17:52:09+09:00
lastmod: 2026-07-04T17:52:09+09:00
slug: "Python"
draft: false
---

[練習問題/解答例/世界のナベアツ問題/Python](/docs/練習問題/解答例/世界のナベアツ問題/Python)


```
#!/usr/bin/env python
def nabeatsu(n):
    return ['Aho' if i%3==0 or '3' in str(i) else i for i in range(1,n+1)]

print(nabeatsu(int(input('n: '))))
```


\#わかりやすく

```
'''
# 誤った実装
n = 1
while n + 1> n:  # 常に真
	 if n % 3 == 0:
		 print "aho"
	 elif "3" in str(n): 
		 print "aho"
	 else:
		 print n
	 n += 1
'''
```


↑の無限ループを排除

```
n = int(input('n: '))
for i in range(1, n+1):
    if i % 3 == 0:
        print("aho")
    elif "3" in str(i): 
        print("aho")
    else:
        print(i)
```


ワンライナー

```
["aho" if x % 3 == 0 or "3" in str(x) else x for x in range(1, 41)]
```


こういう書き方もあります。

```
[(((x%3==0 or '3' in str(x)) and 'aho') or x) for x in range(1,41)]
```
