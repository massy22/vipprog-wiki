---
title: "Python"
date: 2026-07-04T18:03:33+09:00
lastmod: 2026-07-04T18:03:33+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)

```
#!/usr/bin/python
import sys
from random import shuffle, choice
from itertools import count
from collections import defaultdict

with(open(sys.argv[1], 'r')) as F:
    dic = list(set(F.read().strip().split('\n')))
first_words = [ e[0] for e in dic ]
used = defaultdict(int)

players = [ 'あなた', 'わたし' ]
shuffle(players)
startswith = None
for i in count(1):
    if players[i % len(players)] == 'あなた':
        if startswith == None:
            startswith = choice(first_words)
        sys.stdout.write('{0:3}: あなたの番です。 "{1}": '.format(i, startswith))
        s = input()
        while not (s.startswith(startswith) and s in dic):
            if not s.startswith(startswith):
                print('"{0}"で始まっていません。 '.format(startswith))
            else:
                print('辞書にありません。')
            sys.stdout.write('{0:3}: あなたの番です。 "{1}": '.format(i, startswith))
            s = input()
        if s in dic:
            if s in used:
                print('"{0}"は{1}回目に{2}が使用しています。わたしの勝ちです。'.format(s, used[s], players[used[s]%len(players)]))
                break
            startswith = s[-1]
            used[s] = i
    else:
        msg = '{0:3}: わたしの番です。      '.format(i)
        if startswith == None:
            word = choice(dic)
            startswith = word[-1]
            used[word] = i
            print(msg + '{0}'.format(word))
        else:
            words = [ e for e in dic if e.startswith(startswith) and e not in used ]
            if len(words) == 0:
                print('まいりました! あなたの勝ちです。')
                break
            else:
                word = choice(words)
                startswith = word[-1]
                used[word] = i
                print(msg + '{0}'.format(word))
print('今回のしりとりでは{0}個の単語を使用しました。'.format(len(used)))
```


```
import sys
import random

try:
    with open(sys.argv[1], 'r') as f:
        words = tuple(set(f.read().strip().split('\n')))
except FileNotFoundError:
    words = None
if not words:
    words = ('one', 'two', 'three', 'eight', 'nine', 'ten')
    print("使える辞書がないお…")
    print(f"だからテスト辞書でやるお！ ({' '.join(words)})")

unused_words = set(words)
history = dict([(w, None) for w in words])

HUMAN, CPU = 'おめー', 'やる夫'
players = [HUMAN, CPU]

cur_p = random.choice(players)
cur_word = ''
prev_tail = random.choice(words)[0]
winner = None

for turn in range(len(words)+1):
    if cur_p == HUMAN:
        while True:
            cur_word = input(f"{HUMAN}>{prev_tail}: ")
            if cur_word not in words:
                print(f"{CPU}  : 何言ってんだこいつ")
            elif not cur_word.startswith(prev_tail):
                print(f"{prev_tail}から始まってないお")
            else:
                break
        if history[cur_word] is not None:
            winner = CPU
            break
    else:
        usables = [w for w in unused_words if w.startswith(prev_tail)]
        if len(usables) == 0:
            winner = HUMAN
            break
        cur_word = random.choice(usables)
        print(f"{CPU}  : {cur_word}")
    unused_words.remove(cur_word)
    history[cur_word] = (cur_p, turn)
    
    cur_p = HUMAN if cur_p == CPU else CPU
    prev_tail = cur_word[-1]

if winner == CPU:
    p, turn = history[cur_word]
    print(f"それは{turn+1}回目に{p}が使ったお。{CPU}の勝ちだお")
else:
    print(f"負けたお…{HUMAN}の勝ちだお…")
print(f"{len(words) - len(unused_words)}個の単語が出たお")
```
