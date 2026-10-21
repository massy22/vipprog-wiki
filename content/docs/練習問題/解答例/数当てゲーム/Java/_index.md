---
title: "Java"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Java"
draft: false
---

import java.io.*;

public class Kazuate {

```
	public static void main(String[] args) {
		BufferedReader r = new BufferedReader(new InputStreamReader(System.in));
		// ループ用のboolean変数
		boolean b = true;
		// ゲームの説明
		System.out.println("□■数当てゲーム■□");
		System.out.println("1から100までの答えの数字を当てるゲームです");
		System.out.println("ヒント：誤差によってコメントが異なります");
		System.out.println("");
		System.out.println("数字を入力してください");
		// ランダム数字再抽選＆例外処理(数字以外が入力された場合)のループ
		// (※2)
		while (b) {
			// ランダムで1から100までの数字を1つ抽選
			int i = (int)(Math.random() * 100) + 1;
```


```
			try {
				// 
				while (b) {
					try {
						String s = r.readLine();
						int ans = Integer.parseInt(s);
						if ( ans >= 100) {
							System.out.println("数字の範囲は1から100までです");
						}
						// 入力の数字から答えの数を引いて誤差を調べる
						int in = ans - i;
						// 確認デバッグ用
```


```
						// 入力の数字が答えよりも大きい場合
						if (in < 0) {
							// 誤差5以下
							if (in >= -5) {
								System.out.println("あとすこし小さいです");
							// 誤差10以下
							} else if (in >= -10) {
								System.out.println("すこし小さいです");
							// それ以上
							} else {
								System.out.println("小さいです");
							}
						// 
						} else if (in > 0) {
							// 誤差5以下
							if (in <= 5) {
								System.out.println("あとすこし大きいです");
							// 誤差5以下
							} else if (in <= 10) {
								System.out.println("すこし大きいです");
							// それ以上
							} else {
								System.out.println("大きいです");
							}
							// 正解の場合(※1まで)ループ脱出
						} else {
							System.out.println("正解!!");
							break;
						}
					} catch (IOException e) {
						System.out.println(e);
					} catch (NumberFormatException e) {
						System.out.println("半角数字で入力してください");
					}
				}
				// (※1)
				System.out.println("ゲームを続けますか？");
				System.out.println("y.続ける\tそれ以外:終わる");
				String s = r.readLine();
				// 入力がyの場合(※2)に戻ってループ再開
				if (s.equals("y")) {
					continue;
				// それ以外の場合、お疲れ様コメントまでループ脱出
				} else {
					b = false;
				}
			} catch (IOException e) {
				System.out.println(e);
			}
		}
		System.out.println("お疲れ様でした");
	}
```

}
