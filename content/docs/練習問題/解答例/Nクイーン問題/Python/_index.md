---
title: "Python"
date: 2026-07-04T18:42:53+09:00
lastmod: 2026-07-04T18:42:53+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#n-queens)

盤面7x7で事前設置2個の場合の特殊解。

```
N = 7
mp = [ list(input(">>> ")) for _ in range(N) ]
q = [ (r, c) for c in range(N) for r in range(N) if mp[r][c] == 'Q' ]
dr, dc = q[1][0] - q[0][0], q[1][1] - q[0][1]
nr, nc = (q[1][0] + dr) % N, (q[1][1] + dc) % N
while mp[nr][nc] != 'Q':
    mp[nr][nc] = 'Q'
    nr = (nr + dr) % N
    nc = (nc + dc) % N
print('\n'.join(''.join(mp[r]) for r in range(N)))
```


---

盤面の大きさや事前設置個数を限定しない一般解。<br />
できるだけ多く置く（事前設置状態によってはN個置けない）という点が典型的なNクイーン問題より少し難解。後述する[テストケース](#test4)を参照。


```
def can_put(new_col, new_row, used_rows):
    if used_rows[new_col] != -1: return False
    for col,row in enumerate(used_rows):
        if row == -1: continue
        if abs(new_row - row) == abs(new_col - col): # hits diagonally
            return False
    return True

N = int(input(">>> N = "))

# In this situation, suppose (N+1)xN board.
# -1 means undecided. N means no queen.
used_rows = [-1] * N
free_rows = set(range(N+1))

for row in range(N):
    line = input(">>> ")
    col = min(line.find('Q'), N)
    if col == -1: continue
    if can_put(col, row, used_rows):
        used_rows[col] = row
        free_rows.remove(row)

solutions = [None for _ in range(N+1)]

def solve(used_rows, free_rows):
    n_queens_on = len([r for r in used_rows if r != -1 and r != N])
    if solutions[n_queens_on] is None:
        solutions[n_queens_on] = tuple(used_rows)
    
    if len(free_rows) == 1: # since row side is longer
        return
        
    col = used_rows.index(-1)
    for row in free_rows:
        if can_put(col, row, used_rows):
            used_rows[col] = row
            free_rows.remove(row)
            solve(used_rows, free_rows)
            
            # They're mutable, so write back.
            used_rows[col] = -1
            free_rows.add(row)

solve(used_rows, free_rows)

def display(solution):
    board = [['.'] * N for _ in range(N)]
    for col,row in enumerate(solution):
        if row == -1 or row == N: continue
        board[row][col] = 'Q'
    print("\n".join("".join(board[row]) for row in range(N)))

for n in range(N, 0, -1):
    s = solutions[n] 
    if s is None: continue
    print(n)
    display(s)
    break
```


<span id="test4">テストケース</span>

```
>>> N = 4
>>> ..Q
>>> 
>>> .Q
>>> 
3
..Q.
....
.Q..
...Q
```
