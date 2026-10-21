---
title: "MASM"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "MASM"
draft: false
---

```
.386
.model	flat, stdcall
option	casemap: none

include windows.inc

include kernel32.inc
includelib kernel32.lib

.data
Fizz		db	"Fizz",0Ah,0
Buzz		db	"Buzz",0Ah,0
FizzBuzz	db	"FizzBuzz",0Ah,0

Count	dd	100

.data?
hStdout	dd	?
Dummy	dd	?
Buf		db	128 dup(?)

.code
Start:

Init:

	push STD_OUTPUT_HANDLE
	call GetStdHandle
	mov hStdout, eax
	 
	jmp MainRoutine
	 
MainRoutine:

	mov eax, Count
	mov edx, Count
	shr edx, 16
	mov bx, 15
	div bx
	test dx, dx
	jz WriteFizzBuzz

	mov eax, Count
	mov edx, Count
	shr edx, 16
	mov bx, 3
	div bx
	test dx, dx
	jz WriteFizz

	mov eax, Count
	mov edx, Count
	shr edx, 16
	mov bx, 5
	div bx
	test dx, dx
	jz WriteBuzz
	 
	jmp WriteN

DecrimentCount:

	dec Count
	mov eax, Count
	test eax, eax
	jnz MainRoutine
	 
	jmp Return

WriteFizz:

	push offset Fizz
	call lstrlen
	push NULL
	push offset Dummy
	push eax
	push offset Fizz
	push hStdout
	call WriteConsole

	jmp DecrimentCount

WriteBuzz:

	push offset Buzz
	call lstrlen
	push NULL
	push offset Dummy
	push eax
	push offset Buzz
	push hStdout
	call WriteConsole

	jmp DecrimentCount
	 
WriteFizzBuzz:

	push offset FizzBuzz
	call lstrlen
	push NULL
	push offset Dummy
	push eax
	push offset FizzBuzz
	push hStdout
	call WriteConsole

	jmp DecrimentCount

WriteN:

	mov eax, Count
	mov edx, Count
	shr edx, 16
	mov bx, 10
	div bx
	mov cx, dx
	mov edx, eax
	shr edx, 16
	mov bx, 10
	div bx			;axには三桁目　dxには二桁目　cxには一桁目
	 
	add al, 30h
	add dl, 30h
	add cl, 30h

	mov ebx, offset Buf
	mov [ebx + 0], al
	mov [ebx + 1], dl
	mov [ebx + 2], cl
	mov al, 0Ah
	mov dl, 0
	mov [ebx + 3], al
	mov [ebx + 4], dl

	push offset Buf
	call lstrlen
	push NULL
	push offset Dummy
	push eax
	push offset Buf
	push hStdout
	call WriteConsole

	jmp DecrimentCount

Return:
	push 0
	call ExitProcess

end Start
```
