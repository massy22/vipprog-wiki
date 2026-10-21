---
title: "数列"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "数列"
draft: false
---

[数学](/docs/数学)

高校数学で学ぶ「数列」はC言語とかで使われる
「配列」と相性が良いぞ！特に漸化式。

int Suretu[50];
Suretu[0]=1;Suretu[1]=1;
for(i=2;i!=50;i++){
Suretu[i]=Suretu[i-1]+Suretu[i-2];
}

printf(%dSuretu[49]);

これで、フィボナッティが求まるぞ！すごすぎ！！！１１１！！

なにこれこわいｗｗｗｗｗｗｗｗｗｗprintfこわいｗｗｗｗｗｗｗ
