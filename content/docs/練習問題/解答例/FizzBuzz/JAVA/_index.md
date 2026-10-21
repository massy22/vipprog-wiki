---
title: "JAVA"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "JAVA"
draft: false
---

```
import java.io.*;

public class fizzbuzz {
	public static void main(String[] args) throws IOException {
		System.out.print("How many times do loop:");
		BufferedReader br =
			new BufferedReader(new InputStreamReader(System.in));
			String loopnum = br.readLine();
		    int loop=Integer.parseInt(loopnum);
		for(int j=0;j<=loop;j++){
 			if(j%15==0){
 				System.out.println("FizzBuzz");
 			}
 			else if(j%5==0){
 				System.out.println("Buzz");
 			}
 			else if(j%3==0){
 				System.out.println("Fizz");
 			}
			else {
				System.out.println(j);				
			}
		}
	}
}
```
