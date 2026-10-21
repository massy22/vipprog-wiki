---
title: "Python"
date: 2026-07-11T23:57:53+09:00
lastmod: 2026-07-11T23:57:53+09:00
slug: "Python"
draft: false
---

[練習問題(アルゴリズム編)](/docs/練習問題-アルゴリズム編-)


```
'''
python main.py 1 2 + 4 5 + *
> 27.0
python main.py 1 2 + 3 * 4 5 / -
> 8.2
python main.py 5 13 + 6 / 2 % 4 5 * -
> -19.0
'''
import sys
st = []
for e in sys.argv[1:]:
  try:
    if e=='+':
      b, a = st.pop(), st.pop()
      st.append(a+b)
    elif e=='-':
      b, a = st.pop(), st.pop()
      st.append(a-b)
    elif e=='*':
      b, a = st.pop(), st.pop()
      st.append(a*b)
    elif e=='/':
      b, a = st.pop(), st.pop()
      st.append(a/b)
    elif e=='%':
      b, a = st.pop(), st.pop()
      st.append(a%b)
    else:
      st.append(float(e))
  except IndexError:
    print('IndexError: 演算には2個の数が必要です。')
    exit(1)
print(st[-1] if st else 0.0)
```
