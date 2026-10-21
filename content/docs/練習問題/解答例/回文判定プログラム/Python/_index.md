---
title: "Python"
date: 2026-07-04T16:37:29+09:00
lastmod: 2026-07-04T16:37:29+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題#palindrome)

```
#!/usr/bin/python
# main.py
from collections import namedtuple

Word = namedtuple('Word', 'letter, pos')

class Solver:
    def __init__(self, s):
        self.copy = s
        self.arr = list(s)
        self.cost = 0

    def __change(self, letter, cost, *pos):
        for p in pos:
            self.arr[p] = letter
        self.cost += cost * len(pos)

    __change_to_N = lambda self, *pos: self.__change('N', 10, *pos)
    __change_to_O = lambda self, *pos: self.__change('O', 15, *pos)

    def to_palindromically(self):
        sz = len(self.arr)
        for i in range(sz//2):
            j = -1 - i
            if self.arr[i] == self.arr[j]:
                if self.arr[i] == '*':
                    self.__change_to_N(i, j)
            else:
                if not '*' in (self.arr[i], self.arr[j]):
                    return (self.copy, -1)
                srt = sorted((Word(self.arr[i], i), Word(self.arr[j], j)))
                if srt[-1].letter == 'N':
                    self.__change_to_N(srt[0].pos)
                elif srt[-1].letter == 'O':
                    self.__change_to_O(srt[0].pos)
        if sz & 1 and self.arr[sz//2] == '*':
            self.__change_to_N(sz//2)
        return ''.join(self.arr), self.cost
```


```
#!/usr/bin/python
# test.py
from main import Solver
from collections import namedtuple
import unittest

T = namedtuple('T', 'input_data, expected')

test_cases = [
  T('NOO*', ('NOON', 10)),
  T('NO*N', ('NOON', 15)),
  T('NO',   ('NO', -1)),
  T('O*O',  ('ONO', 10)),
  T('*********',  ('NNNNNNNNN', 90)),
  T('**********', ('NNNNNNNNNN', 100)),
  T('*O*******',  ('NONNNNNON', 85)),
  T('*O********', ('NONNNNNNON', 95)),
  T('*N*******',  ('NNNNNNNNN', 80)),
  T('*N********', ('NNNNNNNNNN', 90)),
  T('*N*****O*',  ('*N*****O*', -1)),
  T('*N******O*', ('*N******O*', -1)),
  T('****N****',  ('NNNNNNNNN', 80)),
  T('****N*****', ('NNNNNNNNNN', 90)),
  T('****O****',  ('NNNNONNNN', 80)),
  T('****NO****', ('****NO****', -1)),
]

class TestSequence(unittest.TestCase):
    pass

def test_generator(input_data, expected):
    def test(self):
        obj = Solver(input_data)
        self.assertEqual(obj.to_palindromically(), expected)
    return test

for case in test_cases:
    name = 'test{0}'.format(case.input_data)
    test = test_generator(case.input_data, case.expected)
    setattr(TestSequence, name, test)
suite = unittest.TestLoader().loadTestsFromTestCase(TestSequence)
unittest.TextTestRunner().run(suite)
```


---

解答2

```
cost_table = {'N': 10, 'O': 15}

def palindrome(s):
    size = len(s)
    cost = 0
    res = [''] * size
    for l in range((size+1)//2):
        r = (-l-1)%size
        is_center = 1 if l == r else 0
        c0, c1 = (s[l], s[r]) if s[l] == '*' else (s[r], s[l])
        
        if c0 == '*':
            n_change = 1
            if c1 == '*':
                c1 = 'N'  # 貪欲
                n_change = 2 - is_center
            res[l] = res[r] = c1
            cost += cost_table[c1] * n_change
        elif c0 == c1:
            res[l] = res[r] = c1
        else:
            cost = -1
            break
    res_str = ''.join(res) if cost != -1 else s
    return res_str, cost

s = input("input: ").upper().strip()
print(palindrome(s))
```
