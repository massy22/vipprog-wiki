---
title: "C++"
date: 2026-07-22T05:40:01+09:00
lastmod: 2026-07-22T05:40:01+09:00
slug: "C--"
draft: false
---

# ハノイの塔 {#c68e3446}

```cpp

//  Promblem
//    hanoi
#include <iostream>
#include <string>

void solve(int x, std::string from, std::string to, std::string work){
	static unsigned int counter = 0;
	if(x == 1){
		std::cout << ++counter << ": " << from << " to " << to << std::endl;
	}else{
		solve(x-1, from, work, to);
		std::cout << ++counter << ": " << from << " to " << to << std::endl;
		solve(x-1, work, to, from);
	}
}

int main() {
	const std::string FROM = "A";
	const std::string TO   = "B";
	const std::string WORK = "C";

	//  Input the circle count
	int x;
	std::cout << "Input x > ";
	std::cin >> x;

	solve(x, FROM, TO, WORK);
	return 0;
}

```
