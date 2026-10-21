---
title: "Python"
date: 2026-07-12T02:51:38+09:00
lastmod: 2026-07-12T02:51:38+09:00
slug: "Python"
draft: false
---

[問題文](/docs/練習問題#critical-path)

空入力でテストを出力。トポロジカルソートは実は自力実装しなくてもgraphlibにある。（toposort_graphlibの部分。本実装では呼んでいない。）

```
# graph は隣接リスト(辞書)で管理

from collections import namedtuple, defaultdict

Node = namedtuple('Node' , ["v", "cost"])

s = input('input:\n').strip()
for _ in range(1):
    if s == '':
        # test data
        V, E = 5, 5
        graph = {
            'A':[Node('D',1)],
            'B':[Node('C',1)],
            'C':[Node('E',1)],
            'D':[Node('B',100), Node('C',10)],
            'E':[]}
        break

    V, E = map(int, s.split())
    graph = defaultdict(list)
    for _ in range(E):
      src, dst, cost = input().upper().split()
      graph[src].append(Node(dst, int(cost)))
      graph[dst]  # default [] will be made when no entry

vertexes = sorted(graph.keys())
START = 'A'
END = vertexes[-1]

    
def toposort(graph):  # 深さ優先探索（DFS）を使うタイプ
    res = []
    UNVISITED, POST, VISITED = 0, 1, 2
    visited = dict((v, UNVISITED) for v in vertexes)
    is_start_found = False

    stack = []
    for v in vertexes:
        if is_start_found: break
        stack.append(v)
        while stack:
            u = stack.pop()
            if visited[u] == UNVISITED:  # 行きがけ
                visited[u] = POST
                stack.append(u)
                for node in graph[u]:
                    if visited[node.v]: continue
                    stack.append(node.v)
            elif visited[u] == POST:  # 帰りがけ
                visited[u] = VISITED
                res.append(u)
                if u == START:
                    is_start_found = True
                    break
    res.reverse()
    return res

def toposort_graphlib(graph):
    import graphlib
    
    # graphlib 用の隣接辞書は先行ノード管理型なので矢の向きが逆
    g = dict((v,[]) for v in graph.keys())
    for src_v, src_list in graph.items():
        for dst in src_list:
            g[dst.v].append(src_v)
    ts = graphlib.TopologicalSorter(g)
    return tuple(ts.static_order())

topo_order = toposort(graph)

# DP
dists = dict((v, -1) for v in vertexes)
dists[START] = 0
prevs = dict((v, -1) for v in vertexes)
for v in topo_order:
    if dists[v] == -1: continue  # STARTと繋がっていない
    for node in graph[v]:
        if dists[node.v] < dists[v] + node.cost:
            dists[node.v] = dists[v] + node.cost
            prevs[node.v] = v

def get_path(t):
    path = []
    while t != -1:
        path.append(t)
        t = prevs[t]
    path.reverse()
    return path

print()
c_path = get_path(END)
print(' -> '.join(c_path))
print(dists[END])

# 簡易チャート
print()
topo_s = [v for v in topo_order if dists[v] != -1]
c_edges = [c_path[i: i+2] for i in range(len(c_path)-1)]
print(''.join(f"{v:<7}" for v in topo_s))
for v in topo_s:
    src_i = topo_s.index(v)
    for node in graph[v]:
        dst_i = topo_s.index(node.v)
        is_critical = [v, node.v] in c_edges
        line_char = "*" if is_critical else "-"
        line = f"{node.cost:{line_char}^{(dst_i-src_i)*7}}"
        print(' '*7*src_i + line + '>')
```


```
A      D      B      C      E
***1***>
       **100**>
       ------10------>
              ***1***>
                     ***1***>
```


---

正しくない実装。[入力によっては正答を返さない](#test-cases)し、そもそも最長経路問題にダイクストラ法は上手くいかない。

```
def dijk(s):
  global d, prev
  d = [0] * V
  used = [False] * V
  prev = [-1] * V
  d[s] = 0
  while True:
    v = -1
    for u in range(V):
      if v!=-1 and cost[v][u] == INF: continue
      if not used[u] and (v==-1 or d[u] > d[v]): v = u
    if v == -1: break
    used[v] = True
    for u in range(V):
      if cost[v][u] == INF: continue
      if d[u] < d[v] + cost[v][u]:
        d[u] = d[v] + cost[v][u]
        prev[u] = v

def get_path(t):
  path = []
  while t != -1:
    path.append(chr(ord('A')+t))
    t = prev[t]
  return ' -> '.join(path[::-1])

V, E = map(int, input('input:\n').split())
INF = 987654321
cost = [ [ INF for _ in range(V+1) ] for _ in range(V+1) ]
for _ in range(E):
  a, b, c = input().split()
  a = ord(a) - ord('A')
  b = ord(b) - ord('A') 
  cost[a][b] = int(c)
dijk(0)
print(get_path(V-1))
print(d[V-1])
```


<span id="test-cases">撃墜例</span>

- 例1


```
3 2
A C 1
B C 2
```

<div style="clear:both;"></div>

```
# 正答は A -> C で 1。
B -> C  # Aが出発点にならない
2
```

- 例2


```
5 5
A D 1
D B 100
D C 10
B C 1
C E 1
```

<div style="clear:both;"></div>

```
# 正答は A -> D -> B -> C -> E で 103。
A -> D -> C -> E
2
```
