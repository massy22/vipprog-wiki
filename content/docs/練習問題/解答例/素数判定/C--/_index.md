---
title: "C++"
date: 2026-07-22T05:26:04+09:00
lastmod: 2026-07-22T05:26:04+09:00
slug: "C--"
draft: false
---

[練習問題](/docs/練習問題#prime)

## 素数判定 {#is-prime}

```cpp
#include <iostream>
#include <cmath>
#include <sstream>

using namespace std;
int main( int argc, char** argv ){
	int x;
	bool is_prime = true;

	if(argc < 2){
		cout << "Input x > ";
		cin >> x;
	}else{
		istringstream is(argv[1]);
		is >> x;
	}

	for( int i = 2; i < static_cast<int>(sqrt(x)) + 1; i++){
		if(( x % i ) == 0 ){
			is_prime = false;
			break;
		}
	}

	if( is_prime )
		cout << x << "は素数" << endl;
	else
		cout << x << "は非素数" << endl;
	return 0;
}
```


## 素数列挙 {#list-primes}
### vectorを使って {#with-vector}

```cpp
#include <iostream>
#include <sstream>
#include <vector>
using namespace std;
int main( int argc, char** argv ){
	vector<bool> prime;
	int x;

	if(argc < 2){
		cout << "Input x > ";
		cin >> x;
	}else{
		istringstream is(argv[1]);
		is >> x;
	}

	// 初期化
	for(int i=0; i <= x; i++)
		prime.push_back(true);

	// 0と1は外す
	prime[0] = prime[1] = false;

	// 倍数をふるい落とす
	for(int i=2; i <= x; i++){
		if(prime[i]) {
			for(int j=2; j*i <= x; j++)
				prime[i*j] = false;
		}
	}

	// 残ったものを表示
	for(int i=0; i <= x; i++)
		if(prime[i])
			cout << i << endl;
	return 0;
}
```
