---
title: "Python"
date: 2026-07-02T02:45:26+09:00
lastmod: 2026-07-02T02:45:26+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#i5e3e061)

```
from calendar import monthrange, weekday
y = int(input('input year: '))
m = int(input('input month: '))
w = ' Mo Tu We Th Fr Sa Su'
D = monthrange(y, m)[1] # last day of the month
F = weekday(y, m, 1)
s = '   ' * (F+1) + '  '.join(map(str,range(1, 10))) + ' ' + ' '.join(map(str,range(10, D+1)))
print(w, end='')
for i, e in enumerate(s):
    print(e, end='\n' if i % len(w) == 0 or (i+1) == len(s) else '')
```


---

日付計算を自力で作るべきではないが、曜日暗算法である[コンウェイのドゥームズデイ法則](https://en.wikipedia.org/wiki/Doomsday_rule)を実装

```
# Sunday = 0, Monday = 1, ...

def isleap(year):
  return (year%4==0 and year%100!=0) or year%400==0

def anchorday(year):
    return (2, 0, 5, 3)[year // 100 % 4]

def doomsday(year):
    year2 = year % 100
    tmp = (year2 + year2 % 2 * 11) // 2
    return  (7 - (tmp + tmp % 2 * 11) + anchorday(year)) % 7
    
def weekday_month1st(year, month):
    doom_dates = {1:3, 2:28, 3:14, 4:4, 5:9, 6:6, 7:11, 8:8, 9:5, 10:10, 11:7, 12:12}
    if isleap(year):
        doom_dates[1] += 1
        doom_dates[2] += 1
    delta = 1 - doom_dates[month]
    return (doomsday(year) + delta) % 7
    
def len_month(year, month):
    if month in [2,4,6,9,11]:
        return 30
    elif month == 2:
        return 28 + int(isleap(year))
    else:
        return 31

y = int(input('input year: '))
m = max(int(input('input month: ')) % 13, 1)
days = [0] * weekday_month1st(y, m) + [i+1 for i in range(len_month(y, m))]
grid = [days[row:row+7] for row in range(0, len(days), 7)]
styler = lambda x: f"{x:>2}" if 0 < x else "  "
print(f"{f'{y}-{m:02}':^20}")
print("Su Mo Tu We Th Fr Sa")
print('\n'.join(' '.join(styler(date) for date in row) for row in grid))
```
