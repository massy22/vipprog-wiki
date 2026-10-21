---
title: "C++(better C)"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C---better-C-"
draft: false
---

### 素数判定 {#t96ef71e}

```
#include<iostream>
#include<math>
using namespace std;
int main( int argc, char** argv ){
	int lim = 0;
	int i;
	bool isPrime = true;
	sscanf( argv[ 1 ], "%d", &lim );
	for( i = 2; i < ( int )( sqrt( lim ) + 1.0 ); i ++ ){
		if(( lim % i ) == 0 ){
			isPrime = false;
			break;
		}
	}
	if( isPrime ){
		printf( "%dは素数\n", lim );
	}else{
		printf( "%dは非素数\n", lim );
	}
	return 0;
}
```

おまけで素数列挙

```
#include<iostream>
#include<math>
using namespace std;
int main( int argc, char** argv ){
	int lim = 0;
	int i, j;
	bool isPrime;
	sscanf( argv[ 1 ], "%d", &lim );
	if( lim == 0 ){
		return -1;
	}
	printf( "%d ", 2 );
	for( i = 3; i < lim; i ++ ){
		isPrime = true;
		for( j = 2; j < ( int )( sqrt( i ) + 1.0 ); j ++ ){
			if(( i % j ) == 0 ){
				isPrime = false;
				break;
			}
		}
		if( isPrime ){
			printf( "%d ", i );
		}
	}
	return 0;
}
```
