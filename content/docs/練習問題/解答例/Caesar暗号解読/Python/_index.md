---
title: "Python"
date: 2026-06-23T11:19:31+09:00
lastmod: 2026-06-23T11:19:31+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

```
a = 'abcdefghijklmnopqrstuvwxyz .,-'
s = 'qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir -ibtqi-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir -ibtqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai -i-qscxmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a zinqiuzimzgiemgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj'
for i in range(len(a)):
    candidate = ''.join(';' if e==';' else a[(a.find(e) + i) % len(a)] for e in s)
    if 'person' in candidate:
        print(candidate)
        break
```


\#初心者用


```
table_str = "abcdefghijklmnopqrstuvwxyz .,-abcdefghijklmnopqrstuvwxyz .,-"
encrypted = "qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir -ibtqi-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir -ibtqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai -i-qscxmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a zinqiuzimzgiemgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj"

table = []
for c in table_str:
    table.append(c)
# table は ['a', 'b', ...] になった

needle_chars = ["p", "e", "r", "s", "o", "n"]
for stride in range(1, len(table)//2):
    # "person"をstride幅で暗号化
    needle_enc = ""
    for c1 in needle_chars:
        idx = table.index(c1)
        needle_enc += table[idx + stride]
        
    # 問題の暗号文が暗号化済"person"を含んでいれば勝ち
    if needle_enc in encrypted:
        decrypted = ""
        for c2 in encrypted:
            if c2 == ";":
                decrypted += ";"
            else:
                idx2 = table.index(c2)
                decrypted += table[idx2 - stride] # pythonはリスト番号がボチボチ負でもOK
        print(decrypted)
        break
```
