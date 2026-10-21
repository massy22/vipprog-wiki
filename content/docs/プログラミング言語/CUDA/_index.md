---
title: "CUDA"
date: 2026-07-26T11:46:18+09:00
lastmod: 2026-07-26T11:46:18+09:00
slug: "CUDA"
draft: false
---

# CUDA {#top}

<br />

# はじめに {#hb5ff43b}
アクセス禁止の巻き添え食ってるのに気付かずに書いたレスを無駄にしないためにこちらに避難。<br />
追い追い真面目に整理します。

# 現行スレ {#o5104131}
[【GPGPU】くだすれCUDAスレ part8【NVIDIA】](https://mevius.5ch.io/test/read.cgi/tech/1465969275/)<br />

# 言語の特徴 {#ked0dc2e}
NVIDIAのGPUを演算用に使うための言語。<br />
拡張部分以外はまんまC++と思っていい。但し、例外は使えないのとnew/deleteに癖があるので注意。<br />
まぁ、詳しいことは[公式サイト](http://www.nvidia.com/object/cuda_home.html)を見てくださいな、と。

# gridとblockとthreadの関係 {#bd849031}
threadが一つのデータ処理単位とするとそれらを集めたのがblockで、blockを集めたのがgrid。

例えばfunc<<<blocks, threads>>>()で呼ぶ場合で考えると、概念上はblocks * threadsのデータを並列に処理するイメージ。<br />
仮に、こんな感じの関数を用意しておいて。
<br />

```
 __global__ void func(float r[], const float a[], const float b[], unsigned size)
 {
   for (unsigned ic = threadIdx + blockDim * blockIdx; ic < size; ic += blockDim * gridDim) {
     r[ic] = a[ic] + b[ic];
   }
 }
```

<br />
こんな感じに呼べば、128thread*1000blockを並列に使いつつ、1億個処理できる。
<br />

```
 func<<<1000, 128>>>(r, a, b, 1億);
```

<br />

これで、coalescedアクセスを維持しつつ、threadも余すことなく使えるはず。
まぁ、実際にはblocksやthreadsをいくつにするかが悩ましいのだけれど。
