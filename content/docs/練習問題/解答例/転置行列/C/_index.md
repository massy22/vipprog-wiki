---
title: "C"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "C"
draft: false
---

## 転置行列(C言語版)のソースプログラム {#n4991da9}

```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define BUFSIZE 300	/* 
			 * size of BUFSIZE is 
			 *             size of buffer(tok)
			 *           + size of delimiter
			 *           + size of carriege return character
			 *           + size of NUL
			 */

	/*                        COL
	 *              |------------------------
	 *                col[0]    col[1]   ...
	 *      -       +---------+---------+----
	 *      | row[0]|mat[0][0]|mat[0][1]|
	 *      |       +---------+---------+----
	 *  ROW | row[1]|mat[1][0]|mat[1][1]|
	 *      |       +---------+---------+----
	 *      | row[2]|mat[2][0]|mat[2][1]|
	 *      |       +---------+---------+----
	 *      |       | ...
	 *
	 * row+i point to col.
	 *
	 * We have Matrix 'mat', 
	 * then mathematical mat(i,j) is equivalent to *(*(row+i) + j)
	 */

struct matrix {
	double **data;
	int rows;	/* gyou */
	int cols;	/* retu */
};


void 
init_matrix(struct matrix *mat, int rows, int cols)
{
	int i;
	mat->rows = rows;
	mat->cols = cols;
	mat->data = (double **)malloc(rows*sizeof(double *));
	for (i=0; i<rows; ++i) {
		*(mat->data+i) = malloc(cols*sizeof(double));
	}
}

void 
free_matrix(struct matrix *mat)
{

	int i;
	int rows = mat->rows, cols = mat->cols;
	for (i=0; i<rows; ++i) {
		free(*(mat->data+i));
		*(mat->data+i) = NULL;
	}
	free(mat->data);
	mat->data = NULL;
}

void
set_matrix_dialog(struct matrix *m)
{
	int i, j;
	double n;
	char buf[BUFSIZE];
	for (j=0; j<m->rows; ++j) {
		for (i=0; i<m->cols; ++i) {
			printf("input value at (%d, %d) element: ", i, j);
			fgets(buf, BUFSIZE-1, stdin);
			sscanf_s(buf, "%lf", &n);
			*(*(m->data+j) + i) = n;
		}
	}
}

void
set_matrix(struct matrix *m)
{
	int i, j;
	double *n = NULL;
	char buf[BUFSIZE], *pbuf, *tok, *nx_tok = NULL, *delim = " \n";

	n = malloc(m->cols*sizeof(double));

	printf("Input [%d] value space separated.\n", m->cols);
	for (j=0; j<m->rows; ++j) {
		memset(n, 0, m->cols*sizeof(double));

		printf("row %d: ", j);
		fgets(buf, BUFSIZE-1, stdin);
		pbuf = buf;

		for (i=0; i<m->cols && (tok=strtok_s(pbuf, delim, &nx_tok)) != NULL; pbuf=NULL, ++i) {
			*(n+i) = atof(tok);
		}

		for (i=0; i<m->cols; ++i) {
			*(*(m->data+j) + i) = *(n+i);
		}
	}
		
	free(n);
	n = NULL;
}

void 
print_matrix(struct matrix *m)
{
	int i, j;

	for (j=0; j<m->rows; ++j) {
		for (i=0; i<m->cols; ++i) {
			printf("%8.3f ", *(*(m->data+j) + i));
		}
		printf("\n");
	}
	printf("\n");
}

void 
transpose_matrix(struct matrix *dest, struct matrix *src)
{
	int i, j;

	for (j=0; j<dest->rows; ++j) {
		for (i=0; i<dest->cols; ++i) {
			*(*(dest->data+j) + i) = *(*(src->data+i) + j);
		}
	}
}

int 
main()
{
	struct matrix mat[2];
	int rows = 3;		/* modify if necessary */
	int cols = 2;		/* modify if necessary */

	init_matrix(&mat[0], rows, cols);
	init_matrix(&mat[1], cols, rows);	/* for transposed matrix */

	/* Uncomment alternative */
	//set_matrix_dialog(&mat[0]);
	set_matrix(&mat[0]);

	puts("[matrix]");
	print_matrix(&mat[0]);
	transpose_matrix(&mat[1], &mat[0]);
	puts("[transposed matrix]");
	print_matrix(&mat[1]);

	free_matrix(&mat[0]);
	free_matrix(&mat[1]);

	getchar();
	return 0;
}
```


## 回答部分 {#abf5bed3}
問題の回答部分は

```
void 
transpose_matrix(struct matrix *dest, struct matrix *src)
```

です。

main()のmat[0]がユーザが用意する行列。
mat[1]がその転置行列になります。

その他の箇所は入力部分だとか表示部分、エラー処理なので気にする人だけ気にしてください。

## 使い方 {#ddeb970a}

```
Input 2 value space separated.
row 0: 
```

と表示されたら、スペース区切りで列の分だけ値を入力してあげてください。
行ずつ入力するようにしてあります。

１要素ずつ入力する場合は

```
set_matrix(&mat[0]);
```

をコメントして、

```
//set_matrix_dialog(&mat[0]);
```

をアンコメントしてあげてください。
