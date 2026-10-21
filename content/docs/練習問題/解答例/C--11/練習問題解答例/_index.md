---
title: "練習問題解答例"
date: 2026-07-04T16:51:34+09:00
lastmod: 2026-07-04T16:51:34+09:00
slug: "練習問題解答例"
draft: false
---

[練習問題](/docs/練習問題)

# 島を数える {#cd8e4aa1}

[問題文](/docs/練習問題#count-islands)


```
#include <bits/stdc++.h>
using namespace std;
#define rep(i,n) for(int i=0;i<(n);++i)

// 四方の定義
int dx[] = { -1, 0, 1, 0 };
int dy[] = {  0, -1, 0, 1 };

using v = vector<bool>;
using vv = vector<v>;

// 深さ優先で島を消していく
inline
void dfs(vv&f, int i, int j, int h, int w) {
  if (i < 0 or j < 0 or i >= h or j >= w) return;
  if (not f[i][j]) return;
  f[i][j] = false;
  rep (k, 4) {
    dfs(f, i + dx[k], j + dy[k], h, w);
  }
}

int main() {
  int h, w; cin >> h >> w;
  vv f(h, v(w)); // f[i][j] = ((i, j) が陸なら true)
  rep (i, h) {
    string s; cin >> s;
    rep (j, w) { f[i][j] = s[j] == '#'; }
  }

  int ans = 0;
  rep (i, h) {
    rep (j, w) {
      if (f[i][j]) {
        ++ans;
        dfs(f, i, j, h, w);
      }
    }
  }
  cout << ans << endl;

  return 0;
}
```
