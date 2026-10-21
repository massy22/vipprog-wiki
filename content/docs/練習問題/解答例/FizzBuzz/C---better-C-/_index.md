---
title: "C++(better C)"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C---better-C-"
draft: false
---

### FizzBuzz {#lc3cde05}

```
#include<iostream>
using namespace std;
int main( int argc, char** argv ){
	int lim = 0;
	int i;
	sscanf( argv[ 1 ], "%d", &lim );
	for( i = 1; i <= lim; i ++ ){
		if( i % 15 == 0 ){
			printf( "FizzBuzz" );
		}else if( i % 3 == 0 ){
			printf( "Fizz" );
		}else if( i % 5 == 0 ){
			printf( "Buzz" );
		}else{
			printf( "%d", i );
		}
		printf( " " );
	}
	return 0;
}
```
