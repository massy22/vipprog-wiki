---
title: "C++(better C)"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C---better-C-"
draft: false
---

### 平方根 {#h1b5f416}

```
#include<iostream>
using namespace std;
int main( int argc, char** argv ){
	double target = .0;
	double result = .0;
	double temp;
	int i, j, k;
	char *str1, *str2;

	sscanf( argv[ 1 ], "%lf", &target );
	sscanf( argv[ 2 ], "%d", &k );
	str1 = ( char* )malloc( k );
	str2 = ( char* )malloc( k );

	if( target == .0 ) return -1;
	for( i = 9; i >= 0; i -- )
		if( i * i <= ( int )( target )) break;
	sprintf( str1, "%d.", i );

	for( j = 0; j < k; j ++ ){
		for( i = 9; i >= 0; i -- ){
			sprintf( str2, "%s%d", str1, i );
			sscanf( str2, "%lf", &temp );
			if(temp * temp <= target ) break;
		}
		strcpy( str1, str2 );
	}
	sscanf( str1, "%lf", &result );
	sprintf( str2, "%%lf,%%.%dlf", k );
	printf( str2, target, result );
	return 0;
}
```
