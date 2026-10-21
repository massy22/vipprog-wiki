---
title: "C++"
date: 2026-07-22T05:42:48+09:00
lastmod: 2026-07-22T05:42:48+09:00
slug: "C--"
draft: false
---

## 転置行列 {#top}

```cpp
// problem
//    transposed matrix
//    vector
#include <iostream>
#include <vector>
#include <string>

int main(){
	std::vector< std::vector<double> > matrix;
	std::vector<double> row;
	char tmp;
	std::string str("");
	while(std::cin.get(tmp)){
		switch(tmp){
			case ' ':
				if(str != "")
					row.push_back(atof(str.c_str()));
				str="";
				break;

			case '\n':
				if(str != "")
					row.push_back(atof(str.c_str()));
				matrix.push_back(row);
				row.clear();
				str="";
				break;

			default:
				str += tmp;
				break;
		}
	}
	if(str != "")
		row.push_back(atof(str.c_str()));
	if(row.size() != 0)
		matrix.push_back(row);

	for(unsigned int j=0; j < matrix[0].size(); j++){
		for(unsigned int i=0; i < matrix.size(); i++){
			std::cout << matrix[i][j] << ' ';
		}
		std::cout << std::endl;
	}
	return 0;
}
```


## vector (begin, end)を使って {#b2b1a7a5}

```cpp
// problem
//    transposed matrix
//    vector_scplit
#include <sstream>
#include <iostream>
#include <vector>
#include <string>
#include <iterator>

int main(){
	std::vector< std::vector<double> > matrix;
	std::string str;
	while(getline(std::cin, str)){
		std::istringstream iss(str);
		std::vector<double> row( (std::istream_iterator<double>(iss)),
			std::istream_iterator<double>() );
		matrix.push_back(row);
	}

	for(unsigned int j=0; j < matrix[0].size(); j++){
		for(unsigned int i=0; i < matrix.size(); i++){
			std::cout << matrix[i][j] << ' ';
		}
		std::cout << std::endl;
	}
	return 0;
}
```
