---
title: "HelloWorld"
date: 2026-07-11T14:05:26+09:00
lastmod: 2026-07-11T14:05:26+09:00
slug: "HelloWorld"
draft: false
---

# HelloWorld {#h214a23e}
プログラミングの伝統。
画面に、「Hello World」という5文字+スペース+5文字を出すだけのプログラム
プログラムの超入門は「画面に文字を出す」ということから始まります。


姉妹ページ[HelloWorkはこちら](/docs/HelloWork)


## &#65;ctiveBasic {#active-basic}

```
#console
Print "Hello, World"
```


## [AutoHotKey](/docs/AutoHotKey) {#auto-hot-key}


```
Gui, Add, Text,, hello world!
Gui, Show
```


## AWK {#awk}

```
#!/usr/bin/awk -f
BEGIN {
  print "Hello, World!"
}
```


## [Brainfuck](/docs/プログラミング言語/Brainfuck) {#bf}

```
++++++++[->+++++++++<]>.<+++++[->++++++<]>-.+++++++..+++.<
++++++[->-----------<]>-.<+++[->----<]>.<
+++++++[->++++++++<]>-.<++++[->++++++<]>.+++.------.--------.<
++++++[->-----------<]>-.<++++[->------<]>+.
```


```
++++++++++[>+++++++>++++++++++>+++>+++++++++<<<<-]>++.>+.+++++++..+++.>++.>---.<<.+++.------.--------.
```


## [C](/docs/プログラミング言語/C) {#c-lang}

- 古い書き方


```
#include<stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}
```


- C99の書き方


```
#include<stdio.h>

main() {
   printf("Hello, World!\n");
}
```


## [C++](/docs/プログラミング言語/C--) {#cpp}

```
#include <iostream>
using namespace std;

int main() {
  cout << "Hello, World!" << endl;
  return 0;
}
```


## [C#](/docs/プログラミング言語/C-Sharp) {#c-sharp}

```
using System;

public class HelloWorld
{
    public static void main()
    {
        Console.WriteLine( "Hello, World!" );
    }
}
```


## [COBOL](/docs/プログラミング言語/COBOL) {#cobol}

```
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLOWORLD.

ENVIRONMENT DIVISION.

DATA DIVISION.

PROCEDURE DIVISION.
    DISPLAY "Hello, World!".
    STOP RUN.
```


## Common Lisp {#common-lisp}

```
(print "Hello World")
```


## [D](/docs/プログラミング言語/D) {#d-lang}

```
import std.stdio;

void main() {
    writeln("Hello, World!");
}
```


## [Delphi](/docs/プログラミング言語/Delphi) {#delphi}

```
program HelloWorld;
begin
  Writeln('Hello, World!');
end.
```


## fortran90 {#fortran}

```
program main
  print *, 'Hello, World!'
end program
```


## Go {#go}

```
package main

func main(){
   println("Hello, World!")
}
```


## [Haskell](/docs/プログラミング言語/Haskell) {#haskell}

```
main = putStrLn "Hello,World"
```


## HQ9+ {#hq9p}

```
H
```


## [HSP](/docs/プログラミング言語/HSP) {#hsp}

```
mes "Hello, World!":stop
```


## [Java](/docs/プログラミング言語/Java) {#java}

```
public class HelloWorld{
  public static void main( String[] args ){
    System.out.println( "Hello, World!" );
  }
}
```


## [JavaScript](/docs/プログラミング言語/JavaScript) {#js}

```
document.write('Hello, World!');
```


## Node.js {#node-js}

```
console.log('Hello, World!');
```


## konoha {#konoha}

```
OUT << "hello,world" << EOL;
```


## m2 {#m2}

```
こそようこそよう
ムーンサムーンサ
```


## [Perl](/docs/プログラミング言語/Perl) {#perl}

```
print "Hello, World!\n";
```


## prolog {#prolog}

```
?- write('Hello, World!').
```


## [Ruby](/docs/プログラミング言語/Ruby) {#ruby}

```
puts "Hello, World!"
```


## [Python](/docs/プログラミング言語/Python) {#python}

```
print("Hello, World!")
```


## [PHP](/docs/プログラミング言語/PHP) {#php}

```
echo "Hello, World!\n"
```


## Scala {#scala}

- スクリプトモード


```
println("Hello, World!")
```

- 普通に


```
object HelloWorld{
  def main(args:Array[String]) = {
    println("Hello, World!")
  }
}
```


## [Scheme](/docs/プログラミング言語/Scheme) {#scheme}

- 簡易


```
"Hello, World!"
(newline)
```

- まとも


```
((lambda ()
 (begin (display "Hello, World") (newline))
))
```


## [ShellScript](/docs/プログラミング言語/ShellScript) {#shell}

- bシェル


```
#!/bin/sh
echo "Hello, World!"
```


- bash


```
#!/bin/bash
echo Hello, World!
```


- zsh(echo)


```
#!/usr/bin/zsh
echo "Hello, World\!"
```


- zsh(printf)


```
#!/usr/bin/zsh
printf "Hello, World\!\n"
```


## Smalltalk {#smalltalk}

```
Transcript cr; show: 'Hello, World!'
```


## [SpeeD](/docs/プログラミング言語/SpeeD) {#speed}

```
call_lib{inorout}*    
makefanc{main}:[in<no>/return<int>]*    
callfanc{main}:startfanc{　　　
makebox_string:[name<hw>/max<255>]*    
inbox[to<hw>]{　　　　
 string["Hello World !"]* }　　
usetool:[from<inorout>]:out_print{    
 print[type<string>/frombox<hw>_allchar]* }  
endfanc[fanc<main>/return<0>_endamar]* }  
```


## Tcl {#tcl}

- CUI


```
puts "Hello, world!"
```


- Tkを用いたGUI


```
button .btn -text "Hello, World!" -command exit
pack .btn
```


## TJS2 {#tjs2}

```
System.inform("hello world!");
```


## Whitespace {#whitespace}


## WSH {#wsh}

```
'VBScript
 WScript.Echo "Hello, World!"
```


```
//JScript
 WScript.Echo("Hello, World!");
```


## [なでしこ](/docs/プログラミング言語/なでしこ) {#nadeshiko}

```
「Hello, World!」と言う
```


## ひまわり {#himawari}

```
「Hello, World!」と、表示
```


```
表示("Hello, World!");
```


## neko mimi Fu** {#bf-neko}

```
おにいさまおにいさまおにいさまおにいさまキスキス…ネコミミ！おにいさまおにいさま
おにいさまおにいさまキスキス…ネコミミ！おにいさまおにいさまおにいさまおにいさま
ネコミミ！おにいさまおにいさまおにいさまおにいさまおにいさまおにいさまネコミミ！
おにいさまおにいさまネコミミモードネコミミモードネコミミモード私のしもべー
キス…したくなっちゃった…ネコミミ！おにいさまおにいさまネコミミ！おにいさま
ネコミミモードネコミミモードネコミミモード私のしもべーキス…したくなっちゃった…
ネコミミ！ネコミミ！や・く・そ・く・よネコミミ！おにいさまや・く・そ・く・よ
おにいさまおにいさまおにいさまおにいさまおにいさまおにいさまおにいさま
や・く・そ・く・よや・く・そ・く・よおにいさまおにいさまおにいさまや・く・そ・く・よ
ネコミミ！や・く・そ・く・よネコミミモードネコミミモード私のしもべーネコミミモード
おにいさまおにいさまおにいさまおにいさまキスキス…ネコミミ！おにいさまおにいさま
おにいさまおにいさまネコミミモード私のしもべーキス…したくなっちゃった…ネコミミ！
や・く・そ・く・よネコミミ！や・く・そ・く・よおにいさまおにいさまおにいさま
や・く・そ・く・よ私のしもべー私のしもべー私のしもべー私のしもべー私のしもべー
私のしもべーや・く・そ・く・よ私のしもべー私のしもべー私のしもべー私のしもべー
私のしもべー私のしもべー私のしもべー私のしもべーや・く・そ・く・よネコミミ！
おにいさまや・く・そ・く・よ
```


## HTML {#html}

```
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>HelloWorld!</title>
</head>
<body>
HelloWorld!
</body>
</html>
```
