---
title: "Python"
date: 2026-07-04T18:06:06+09:00
lastmod: 2026-07-04T18:06:06+09:00
slug: "Python"
draft: false
---

[練習問題](/docs/練習問題)


```
#!/usr/bin/python
arr = []
print('input:')
while True:
    s = input()
    if s == '':
        break
    arr.append(s.split())
#print('\n'.join(' '.join(e) for e in arr))
transposed = zip(*arr)
print('\n'.join(' '.join(e) for e in transposed))
```


\#初心者用

```
n = int(input( "行列の行の数を入力してください:  " ))
m = int(input( "行列の列の数を入力してください:  "))
a = [[] for x in range( n )]
b = [[] for x in range( m )]
for i in range( 1,n + 1 ):
	 for h in range( 1, m + 1 ):
		 a[ i - 1 ].append( input( str( i ) + "行目の" + str( h ) + "列番目を入力してください: " ) )
for h in range( 1,m + 1 ):
	 for i in range( 1, n + 1 ):
		 b[ h - 1 ].append( 0 )
for d in range( n ):
	 print(a[ d ])
for w in range( n ):
	 for k in range( m ):
		 b[ k ][ w ] = a[ w ][ k ]
print("入力された値の転置行列は")
for t in range( m ):
	 print(b[ t ])
```
