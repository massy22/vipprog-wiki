---
title: "Python"
date: 2026-07-11T15:41:32+09:00
lastmod: 2026-07-11T15:41:32+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#maze)

[A*探索](https://ja.wikipedia.org/?curid=157096)。

```
#!/usr/bin/python
import heapq

R, C, N = 10, 10, 10

class Cell(object):
    def __init__(self, r, c, reachable):
        self.r = r
        self.c = c
        self.is_reachable = reachable
        self.parent = None
        self.moving_cost = 0  # 移動コスト
        self.heuristic_cost = 0  # ヒューリスティックコスト
        self.score = 0  # スコア = 移動コスト + ヒューリスティックコスト

    def __lt__(self, other):
        return self.heuristic_cost < other.heuristic_cost


class AStar(object):
    def __init__(self, _mp):
        self.op = []
        heapq.heapify(self.op)
        self.cl = set()
        self.cells = []
        self.grid_height = R
        self.grid_width = C
        self.start = None
        self.end = None
        self.mp = _mp

    def init_grid(self):
        for r in range(self.grid_height):
            for c in range(self.grid_width):
                reachable = mp[r][c] != '#'
                self.cells.append(Cell(r, c, reachable))
        for r in range(self.grid_height):
            for c in range(self.grid_width):
                if r == 0 and mp[r][c] == ' ':
                    self.start = self.__get_cell(r, c)
                if r == R - 1 and mp[r][c] == ' ':
                    self.end = self.__get_cell(r, c)

    def __get_heuristic(self, cell):
        return N * (abs(cell.r - self.end.r) + abs(cell.c - self.end.c))

    def __get_cell(self, r, c):
        return self.cells[r * self.grid_height + c]

    def __get_adjacent_cells(self, cell):
        cells = []
        if cell.r < self.grid_height - 1:
            cells.append(self.__get_cell(cell.r + 1, cell.c))
        if cell.c < self.grid_width - 1:
            cells.append(self.__get_cell(cell.r,     cell.c + 1))
        if cell.r > 0:
            cells.append(self.__get_cell(cell.r - 1, cell.c))
        if cell.c > 0:
            cells.append(self.__get_cell(cell.r,     cell.c - 1))
        return cells

    def __display_path(self):
        cell = self.end
        mp[self.start.r][self.start.c], mp[self.end.r][self.end.c] = '+', '+'
        while cell.parent is not self.start:
            cell = cell.parent
            mp[cell.r][cell.c] = '+'
        print('\n'.join(''.join(mp[r]) for r in range(R)))

    def __update_cell(self, adj, cell):
        adj.moving_cost = cell.moving_cost + N
        adj.heuristic_cost = self.__get_heuristic(adj)
        adj.parent = cell
        adj.score = adj.heuristic_cost + adj.moving_cost

    def process(self):
        heapq.heappush(self.op, (self.start.score, self.start))
        while len(self.op):
            _, cell = heapq.heappop(self.op)
            self.cl.add(cell)
            if cell is self.end:
                self.__display_path()
                break
            adj_cells = self.__get_adjacent_cells(cell)
            for c in adj_cells:
                if c.is_reachable and c not in self.cl:
                    if (c.score, c) in self.op:
                        if c.moving_cost > cell.moving_cost + N:
                            self.__update_cell(c, cell)
                    else:
                        self.__update_cell(c, cell)
                        heapq.heappush(self.op, (c.score, c))

mp = []
print('input: ')
while True:
    s = input()
    if s == '': break
    mp.append(s)
mp = list(map(list, mp))
astar = AStar(mp)
astar.init_grid()
astar.process()
```


---

[幅優先探索](https://ja.wikipedia.org/?curid=12889)。空の入力で[VIP迷路](#vip-maze)を解かせます。

```
import heapq

maze = []
print('input: ')
while True:
    s = input()
    if s == '': break
    maze.append(s)

if len(maze) == 0:
    s = """\
# ##############################
#   #     # #    #   ###     # #
## # ## #   ## #   #  #  # #   #
#    #  # # #  # # # #  # # ## #
# ## ## #  # # #  ###  #       #
#  #  # # ## # # # #  #  # ## ##
##  #   #      #     #  #   #  #
###################### #########"""
    print(f"{s}\n")
    maze = s.split("\n")

UNVISITED = None
WALL = (-1, -1)
PATH = (-2,-2)

ch_2_pt = lambda ch: WALL if ch == '#' else UNVISITED
grid = [[ch_2_pt(ch) for ch in row_str] for row_str in maze]
H = len(grid)
W = len(grid[0])

# detecting the start and goal
doors = {'west': None, 'east': None, 'north': None, 'south': None} 
for y in range(H):
    if grid[y][ 0 ] == UNVISITED: doors['west'] = (y, 0)
    if grid[y][W-1] == UNVISITED: doors['east'] = (y, W-1)
for x in range(W):
    if grid[ 0 ][x] == UNVISITED: doors['north'] = (0, x)
    if grid[H-1][x] == UNVISITED: doors['south'] = (H-1, x)
start, goal = list(d for d in doors.values() if d)[0:2]

# Breadth First Search (BFS)
from collections import deque
queue = deque([start])
grid[start[0]][start[1]] = WALL

while len(queue) > 0:
    y, x = queue.popleft()
    if (y, x) == goal:
        break
    for (dy, dx) in ((-1,0),(0,1),(1,0),(0,-1)):
            if y+dy < 0 or H <= y+dy or x+dx < 0 or W <= x+dx:
                continue
            if grid[y+dy][x+dx] == UNVISITED:
                queue.append((y+dy, x+dx))
                grid[y+dy][x+dx] = (y, x)
                
cur = goal
while cur != WALL:
    y, x = cur
    cur = grid[y][x]
    grid[y][x] = PATH

def pt_2_ch(pt):
    if pt == WALL: return '.'
    elif pt == PATH: return '*'
    else: return ' '
    
maze_solved = "\n".join(''.join(pt_2_ch(pt) for pt in row) for row in grid)
print(maze_solved)
```


<span id="vip-maze"></span>
> 

```
# ##############################
#   #     # #    #   ###     # #
## # ## #   ## #   #  #  # #   #
#    #  # # #  # # # #  # # ## #
# ## ## #  # # #  ###  #       #
#  #  # # ## # # # #  #  # ## ##
##  #   #      #     #  #   #  #
###################### #########

.*..............................
.** .  ***. . ***.   ...*****. .
..*. ..*.*  ..*.*  .  .**. .***.
. ***. *.*. . *.*. . .**. . ..*.
. ..*..*.* . .*.* ...**.*******.
.  .**.*.*.. .*.*. .**.**. .. ..
..  .***.******.*****.**.   .  .
......................*.........
```


---

初心者用：スタートからゴールへの経路を全て塗りつぶすアルゴリズムです。


```
#例題の迷路をリスト型で入力しておきます。
maze = """\
######## #
#        #
# ###### #
# #    # #
# #### # #
#      # #
######## #
##   #   #
#  #   # #
# ########""".split("\n")

print('\nこれは入力された迷路です。')
for i in range(10):	#入力した迷路を表示します。
	print(maze[i])

print('\nこれは経路を全て+で塗りつぶしたものです。')
for i in range(10):	#経路をすべて+で塗りつぶします。
	maze[i] = maze[i].replace(' ','+')
	print(maze[i])

def dig(mat,row,col):
	st = mat[row-1][col] + mat[row][col+1] + mat[row+1][col] + mat[row][col-1]
	cnt = st.count('#') + st.count(' ')
	if cnt >= 3:
		mat[row] = mat[row][:col] + ' ' + mat[row][col+1:]
	else:
		pass

def ent_dig():
	for i in range(1,9):
		for j in range(1,9):
			if maze[i][j] == '+':
				dig(maze,i,j)

cnt = 0
while True:
	pre_maze = list(maze)
	ent_dig()
	if maze == pre_maze:
		print('\n経路検出の結果です。')
		for i in range(10):
			print(maze[i])
		break
	else:
		cnt += 1
		print('\n{0}回目の誤経路削除の結果です。'.format(cnt))
		for i in range(10):
			print(maze[i])
```
