---
title: "Java"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Java"
draft: false
---

```
/*
 * プログラミングスレまとめ in VIP
 * 初心者用課題 素数を求める
 * http://wiki.fdiary.net/vipprog/?%BD%E9%BF%B4%BC%D4%CD%D1%B2%DD%C2%EA
 */
package net.twoch.news4vip;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

/**
 * 素数一覧表示<br>
 * ユーザから指定されたｎ未満の素数を列挙する<br>
 */
public class PrimeNumber {

	/**
	 * Mainメソッド<br>
	 * ユーザからの指定されたnまでの間の素数を標準出力に出力する<br>
	 * 
	 * @param args	コマンドライン引数(利用しない)
	 */
	public static void main(String[] args) {
		System.out.println("１からｎの間の素数を表示するプログラムです");
		
		// ユーザに入力を求める
		int n = getMax();
		// 異常が起きたときなどは負の数が返る
		if (n < 0) {
			System.out.println("異常終了します。");
			// 異常終了(-1)
			System.exit(-1);
		} else {
			// 非素数は全て-1となっているnまでの配列で返ってくる
			int[] prims = getPrimes(n);
			// 画面に表示
			printoutPrims(prims);
		}
	}


	/**
	 * 素数一覧取得<br>
	 * 2-maxの範囲の素数を表示する。<br>
	 * アルゴリズムはエラトステネスの篩を使う。<br>
	 * @param max	最大値
	 */
	private static int[] getPrimes(int max) {
		// 元の配列を作成する。
		// 2,3,4,...,max
		int[] data = createOriginalData(max);
		
		// 篩にかける 非素数には-1を設定する
		for(int i=0; i < data.length; i++) {
			// 非素数なので無視
			if (data[i] == -1) continue;
			
			// 篩にかかって残っているうちの最大値
			int survivalMax = data[i];
			for(int j=i+1; j < data.length; j++) {
				// 既に非素数と判定されておらず
				if ( data[j] != -1) {
					// 基準にしている数値で割り切れるなら素数ではない
					if ( (data[j] % data[i]) == 0 ) {
						data[j] = -1;
					} else {
						survivalMax = data[j];
					}
				}
			}
			// 生存している最大数が、基準値の平方根以下なら、
			// もう篩落とす数はいない
			if ( survivalMax < data[i] * data[i] ) break;
		}
		return data;
	}


	/**
	 * 素数表示<br>
	 * 配列中の-1以外の数を標準出力に出力する。<br>
	 * 
	 * @param data	表示データ
	 */
	private static void printoutPrims(int[] data) {
		// 素数を表示する
		int count = 0;
		for(int i =0; i < data.length; i++) {
			if (data[i] != -1) {
				count++;
				if (count == 10) {
					//横10個で改行
					System.out.println(data[i]);
					count = 0;
				} else {
					System.out.print(data[i] + " ");
				}
			}
		}
	}


	/**
	 * エラトステネスの篩用の初期配列作成<br>
	 * 
	 * @param max	最大値
	 * @return	初期配列
	 */
	private static int[] createOriginalData(int max) {
		int[] data = new int[max - 1];
		for(int i =2; i <= max; i++) {
			data[i-2] = i;
		}
		return data;
	}


	/**
	 * 最大値取得<br>
	 * ユーザのキーボード入力から最大値を取得する<br>
	 *  キー入力取得時に、IOExceptionが発生した場合、-1がかえる<br>
	 *  1以上の値が入力されるまで、再入力を求める。<br>
	 *  
	 * @return	最大値(-1  or 1 <)
	 */
	private static int getMax() {
		// 復返値
		int result = -1;
		BufferedReader bReader = null;
		try {
			// キーボード入力を受けるReaderを作成
			bReader =
				new BufferedReader(new InputStreamReader(System.in));
			// 最大値が設定されるまで繰り返す
			while( result == -1 ) {
				// プロンプトの後ろに入力を求める改行しない (println -> print)
				System.out.print("ｎを入力してEnterキーを押してください。\n>");
				// 改行コードまでの1行を取得 IOExceptionがthrowされる場合がある
				String line = bReader.readLine();
				// 文字列を数値に変換する
				result = string2int(line, 1);
			}
		} catch(IOException e) {
			// bReader.readLine からの異常をここで受け取る
			System.err.println(e.getMessage());
			System.out.println("キーボード入力を受けられませんでした。");
			result = -1;
		} finally {
			// 作成したReaderの後処理
			closeReader(bReader);
		}
		// ユーザが指定した値を返す
		return result;
	}

	/**
	 * 整数値変換<br>
	 * 文字列を、intの整数値に変換して返す。<br>
	 * 変換できない場合、最小値以下の場合は、-1を返す。<br>
	 * 
	 * @param line	文字列
	 * @param low 最小値
	 * @return	整数値(-1 or low<)
	 */
	private static int string2int(String line, int low) {
		int result;
		// 文字列を数値に変換する
		try {
			result = Integer.parseInt(line);
			if (result <= low) {
				result = -1;
				System.out.println("ｎは、" + (low + 1) 
						+ "以上に設定してください。");
			}
		} catch (NumberFormatException e) {
			// Integer.parseInt の異常をここで受け取る
			result = -1;
			System.out.println(line + "は、数値として処理できません。");
		}
		return result;
	}

	/**
	 * リーダークローズ処理<br>
	 * 指定されたリーダーがnullで無い場合、closeする。<br>
	 * close時のIOExceptionは、標準エラーにメッセージを出すだけとする。<br>
	 * 
	 * @param bReader	対象リーダー
	 */
	private static void closeReader(Reader bReader) {
		// JakartaのCommonsIO を使えば簡単になる
		if (bReader != null) {
			try {
				// 関連するストリームごとクローズ
				bReader.close();
			} catch (IOException e) {
				// このIOExceptionは復帰不能なのでエラー出力のみ
				System.err.println(e.getMessage());
			}
		}
	}
}
```
