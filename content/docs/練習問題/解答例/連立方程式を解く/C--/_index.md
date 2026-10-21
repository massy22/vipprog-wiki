---
title: "C++"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C--"
draft: false
---

[練習問題](/docs/練習問題)

Gauss-Jordanの消去法。蟻本のパクリ。


```
/*
実行方法: ./a.out < input.txt
input.txtの中身:
3
1 -2 3
4 -5 6
7 -8 10
6 12 21

先頭行は元数(n)。
続くn行は左辺の係数。
最終行は右辺の定数。

上の例だと
x - 2y + 3z = 6
4x - 5y + 6z = 12
7x - 8y + 10z = 21
を意味する。

これを解くと
(x, y, z) = (1, 2, 3)
となるので、
1, 2, 3, 
と出力する。
*/
#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

const double EPS = 1e-9;

vector<double> solve(const vector<vector<double> >& A, const vector<double>& b) {
    int n = A.size();
    vector<vector<double> > B(n, vector<double>(n+1));
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            B[i][j] = A[i][j];
        }
    }
    for(int i=0; i<n; i++) { B[i][n] = b[i]; }

    for(int i=0; i<n; i++) {
        int pivot = i;
        for(int j=i; j<n; j++) {
            if(abs(B[j][i]) > abs(B[pivot][i])) { pivot = j; }
        }
        swap(B[i], B[pivot]);
        // 解がないか、一意でない場合は長さ0の配列を返すことにする。
        if(abs(B[i][i]) < EPS) { return vector<double>(); }

        for(int j=i+1; j<=n; j++) { B[i][j] /= B[i][i]; }
        for(int j=0; j<n; j++) {
            if(i!=j) {
                for(int k=i+1; k<=n; k++) {
                    B[j][k] -= B[j][i] * B[i][k];
                }
            }
        }
    }
    vector<double> res(n);
    for(int i=0; i<n; i++) { res[i] = B[i][n]; }
    return res;
}

int main(void) {
    int n;  cin >> n;
    vector<vector<double> > A(n, vector<double>(n+1));
    vector<double> b(n);
    for(int i=0; i<n; i++) {
        for(int j=0; j<n; j++) {
            cin >> A[i][j];
        }
    }
    for(int i=0; i<n; i++) {
        cin >> b[i];
    }
    vector<double> res = solve(A, b);
    int sz = res.size();
    for(int i=0; i<sz; i++) { cout << res[i] << ", "; }
    cout << endl;
    return 0;
}
```
