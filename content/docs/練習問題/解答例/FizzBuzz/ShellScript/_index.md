---
title: "ShellScript"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "ShellScript"
draft: false
---

## FizzBuzz(シェルスクリプト版)の回答例 {#jd8a6a61}
### bash {#sea2db6d}

```
#!/bin/bash
echo -n "input max: "
read max

shopt -s extglob
if [[ ${max}x != *([[:digit:]])x ]]; then			# catch the case $max is null or non-numeric
	exit 1
fi

#num=1
#while ((num <= max)); do
#	if ((num%15 == 0)); then
#		echo FizzBuzz
#	elif ((num%3 == 0)); then
#		echo Fizz
#	elif ((num%5 == 0)); then
#		echo Buzz
#	else
#		echo $num
#	fi
#	$((num++))		# or  num=$((num+1))
#
#done

for ((num=1; num <= max; num++)); do
	if ((num%15 == 0)); then
		echo FizzBuzz
	elif ((num%3 == 0)); then
		echo Fizz
	elif ((num%5 == 0)); then
		echo Buzz
	else
		echo $num
	fi
done

exit 0
```


#### 補足 {#zdf781c9}
回答部分はwhileブロックもしくはforブロックです。
他は入力部分とエラー処理になります。

また、コメントされているところはforブロックとそのまま置き換えることもできます。

このスクリプトはbash ver.2.0以降の組み込みコマンドのみで書かれています。


### ash {#bcaeaaf5}

```
#!/bin/ash
echo -n "input max: "
read max

if test x$max = x; then				# true if $max is null
	exit 1
fi

export max
if (tmp=`expr $max + 1`); test $? != 0; then	# true if $max is non-numeric
	exit 1;
fi

num=1
while test $num -le $max; do
	if test `expr $num % 15` -eq 0 ; then
		echo FizzBuzz
	elif test `expr $num % 3` -eq 0; then
		echo Fizz
	elif test `expr $num % 5` -eq 0; then
		echo Buzz
	else
		echo $num
	fi
	num=`expr $num + 1`
done

exit 0
```


#### 補足 {#mf94328a}
いわゆるBshell系の環境であれば動くと思います。
