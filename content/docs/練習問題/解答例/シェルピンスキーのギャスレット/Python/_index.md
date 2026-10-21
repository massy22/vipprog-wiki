---
title: "Python"
date: 2026-07-02T05:35:06+09:00
lastmod: 2026-07-02T05:35:06+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#w9c362ad)

1次元セルオートマトンのルール60と同等実装。[ルール90](https://ja.wikipedia.org/?curid=46664#.E3.83.AB.E3.83.BC.E3.83.AB90)だと左右に広がる。

```
SZ = 33
s = [ [ 0 for _ in range(SZ) ] for _ in range(SZ) ]
s[0][1] = 1
for r in range(SZ-1):
  for c in range(1, SZ):
    s[r+1][c] = s[r][c] ^ s[r][c-1]
print('\n'.join(''.join('*' if s[r][c] else ' ' for c in range(1, SZ)) for r in range(SZ-1)))
```


無限に流しておく実装。停止はCtrl+Cで。

```
import time

Width = 76
cells = [0] * Width
cells_next = cells.copy()
cells[1] = 1

while True:
    print(''.join('*' if cells[c] else ' ' for c in range(1, Width)))
    for c in range(1, Width):
        cells_next[c] = cells[c] ^ cells[c-1]
    cells, cells_next = cells_next, cells
    time.sleep(0.05)
```


---

ギャス「ケ」ットだった。死にたい。


```
import turtle
import math

turtle.speed(6)

# 最初の三角形の各座標を決めます。
# 下記実装は正三角形ですが形は自由です。
A = (0, 270)
B = (- 270 * math.sqrt(3)/2, -270 * 1/2)
C = (270 * math.sqrt(3)/2, -270 * 1/2)

first_tri = [A,B,C]  # 最初の三角形の各座標をリストに格納します。

def draw_triangle(tri_points):  # 3座標のリストを受け取り、三角を描く関数を定義します。
    a, b, c = tri_points
    turtle.penup()
    turtle.goto(a)
    turtle.pendown()
    turtle.begin_fill()
    turtle.goto(b)
    turtle.goto(c)
    turtle.goto(a)
    turtle.end_fill()  # 塗りつぶします。

draw_triangle(first_tri)  # 最初の三角を描きます。

turtle.fillcolor('white')  # 穴を白く塗りつぶして表現するため、fillcolorを白色にします。

# 描画の順番待ちリストを作ります。
# （このような「後ろに追加・前から取り出し」の構造をキューと呼ぶ。
# 実は以下のようにリストでやるのは非効率。なので collections.deque 使え。）
tri_queue = []
tri_queue.append(first_tri)  # 最初の三角を先頭に据えます。

def mid_points(tri_points):  # 三角の中点3つを求める関数を定義します。
    a, b, c = tri_points
    m_ab = ((a[0] + b[0]) / 2, (a[1] + b[1]) / 2)
    m_bc = ((b[0] + c[0]) / 2, (b[1] + c[1]) / 2)
    m_ca = ((c[0] + a[0]) / 2, (c[1] + a[1]) / 2)
    return [m_ab, m_bc, m_ca]

def draw_gasket(level):  # シェルピンスキーのギャスケットを描く関数です。
    n_iter = (3**level - 1)//2  # 描画回数は 1 + 3 + 3^2 + ... の等比級数の和として事前にわかります。

    for _ in range(n_iter):
        tri = tri_queue.pop(0)  # 先頭を取り出します。
        m_ab, m_bc, m_ca = mid_points(tri)
        draw_triangle([m_ab, m_bc, m_ca])  # 穴部分を描きます。

        # 穴により3つの黒三角に分割されるので、それぞれを順番待ちに入れます。
        a, b, c = tri
        tri_queue.append([   a, m_ab, m_ca])
        tri_queue.append([m_ab,    b, m_bc])
        tri_queue.append([m_ca, m_bc,    c])

draw_gasket(4)
turtle.done()
```
