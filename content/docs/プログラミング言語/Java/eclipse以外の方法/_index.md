---
title: "eclipse以外の方法"
date: 2026-07-26T10:24:04+09:00
lastmod: 2026-07-26T10:24:04+09:00
slug: "eclipse以外の方法"
draft: false
---

# eclipse以外の方法 {#top}


## 注意 {#kfb740e1}

- <strong>基本的にJDKを使います。すでにJREが入ってる場合はいっぺんアンインストールしたほうが良いかも</strong>
- 実行できたらソースファイル内のHelloWork部分を適当な文字にかえてみよう


## NetBeansを使う {#y0168c4e}

- eclipseと似たようなもん
- http://java.sun.com/javase/ja/6/download.htmlにある「JDK 6u2 with NetBeans 5.5.1」をダウンロードしてインストールする
- 使い方はだれかよろしく

ここでも見とけ
http://allabout.co.jp/internet/java/closeup/CU20060501C/

## JCPadを使う {#l2177a01}
### JDKインストール {#w441a945}

- http://java.sun.com/javase/ja/6/download.htmlにある「JDK 6u2」をダウンロードしてインストールする。
  - インストールフォルダはデフォルトではなくC:\Javaあたりが良いかも。空白がない方がトラブルが少ない気がするんで。

### JCPadインストール {#qc468354}

- http://www.vector.co.jp/soft/win95/prog/se153698.htmlをダウンロードする
- ダウンロードしたファイルを適当なフォルダに展開する。アプリ用フォルダがあるならそのへんに。
- jcpad.exeを実行する
- 設定画面が出てくるので「コンパイラのパス」にjavac.exeの場所を指定する
  - C:\Java\jdk1.6.0_02\bin\javac.exeみたいなかんじ
- 「標準のデータ保存フォルダ」に保存用のフォルダを指定する
  - C:\vip
- OK押せばjcpadが起動します

### コンパイルの準備 {#sample}

- 以下を貼り付ける


```
public class Sample {
    public static void main(String[] args) {
        System.out.println("HelloWork");
    }
}
```

- sampleフォルダを作ってファイル名にSampleって入れて保存。Sは大文字な。
  - いろいろ作っていくとワケワカメになるからプログラムごとにフォルダを作ったほうがきっと良いよ
  - C:\vip\sample\Sample.javaとなる

### コンパイル＆実行 {#q3d53f67}

- 青い三角ボタンかF9を押す
- こんなんが出ればおｋ


```
C:\vip\sample>java Sample
HelloWork
 -- Press any key to exit (Input "c" to continue) --
```

- エンター押して終了


## コマンドラインで実行してみる {#b83acfdb}
### JDKインストール {#qb8b74c4}

- http://java.sun.com/javase/ja/6/download.htmlにある「JDK 6 Update 15」をダウンロードしてインストールする

### 環境変数の設定(以下はWindows XPの場合) {#vc7342ad}
<strong>環境変数をいじりたくない人は[こっち](#no-change-env)を見てくれ</strong>

- マイコンピュータ右クリック→プロパティ
- 詳細設定タブ→環境変数→システム環境変数(ユーザーのほうでもたぶんおｋ)→新規

|変数名|JAVA_HOME|
|---|---|
|変数値|C:\Java\jdk1.6.0_15(JDKのインストールディレクトリ)|

- Pathはすでにあるので探してダブルクリック。変数値の一番後ろに以下を追加。PathはWindowsが実行ファイルを探してくれるところ。これが間違ってるとjavac.exeが見つからないといわれる。<strong>Pathにすでにある変数値を消さないように気をつけよう！ミスって消したらキャンセルしてやり直せ！</strong>


```
;%JAVA_HOME%\bin;
```

### コマンドプロンプトでやってみる {#y11968f6}

- スタート→プログラム→アクセサリからコマンドプロンプトを実行。こんなんがでてくる。


```
C:\Documents and Settings\<ユーザ名>>
```

- javac -versionと入力してエンター。以下のようになればおｋ


```
C:\Documents and Settings\<ユーザ名>>javac -version
javac 1.6.0_02
```

### コンパイルの準備 {#b5ec8feb}

- Javaソースファイルを適当なフォルダに作ってみる
  - C:\vipにSample.javaを作成して以下を保存


```
public class Sample {
    public static void main(String[] args) {
        System.out.println("HelloWork");
    }
}
```

### コンパイル＆実行 {#v0590a58}

- ファイルを保存したフォルダに移動してコンパイルする。cdコマンドで移動。javacコマンドでコンパイル。何もでなければおｋ。


```
C:\Documents and Settings\<ユーザ名>>cd c:\vip

C:\vip>javac Sample.java
```

- javaコマンドで実行してやるぜええええ！


```
C:\vip>java Sample
HelloWork
```


### コマンドの簡単な解説 {#y3614438}

<dl>
  <dt>cd</dt>
  <dd>change directory。フォルダ移動。エクスプローラで見たいフォルダへ移動するイメージ</dd>
</dl>


```
cd 移動先のフォルダ
```


<dl>
  <dt>javac</dt>
  <dd>Javaソースをコンパイルする。コンパイル後にはclassファイルができる。</dd>
</dl>


```
javac コンパイル対象ファイル
```


<dl>
  <dt>java</dt>
  <dd>コンパイルされたclassファイルを実行する。.classはつけない</dd>
</dl>


```
java クラス名
```

### エディタについて {#n6a73d8b}

- メモ帳だとちょっとわかりづらいなーって場合は[TeraPad](http://www5f.biglobe.ne.jp/~t-susumu/library/tpad.html)や[サクラエディタ](http://sakura_editor.at.infoseek.co.jp/)や[xyzzy](http://www.jsdlab.co.jp/~kamei/)(emacs系)なんかを使ってみると幸せになれるかも

### 環境変数をいじりたくなかったりバッチファイルで実行したい場合 {#no-change-env}

- バッチファイルを作って実行まで一気にやっちまえ
- JDKのインストールと[Sample.javaの作成](#sample)はやっとけ
- 以下を貼り付けてsample.batとして保存
  - JAVA_HOMEにはJDKのインストールディレクトリ。Program Filesみたいに空白がある場合は""でくくる。
    - set JAVA_HOME="C:\Program  Files\Java\jdk1.6.0_02"みたいにする
  - PATHはWindowsが実行ファイルを探してくれるところ。これが間違ってるとjavac.exeが見つからないといわれる


```
set JAVA_HOME=C:\Java\jdk1.6.0_02
set PATH=%JAVA_HOME%\bin;%PATH%;
javac Sample.java
java Sample
pause
```

- sample.batをダブルクリックすれば実行される。何かキー押せば黒い窓は消えるよ。以下は成功例。HelloWorkが出ればおｋ


```
C:\vip\sample>set JAVA_HOME=C:\Java\jdk1.6.0_02

C:\vip\sample>set PATH=C:\Java\jdk1.6.0_02\bin;C:\WINDOWS\system32;C:\WIN
DOWS;C:\WINDOWS\System32\Wbem;

C:\vip\sample>javac Sample.java

C:\vip\sample>java Sample
HelloWork

C:\vip\sample>pause
続行するには何かキーを押してください . . .
```

## ちょっとランクアップしたいならこっち {#pcf9f2d0}
ビルドツールを使ってみよう。でかいもん作るときはこっちのほうが楽かもね。ちなみにeclipseではプラグイン入れたり入れなかったりして両方使えます。Netbeansはそれ自体がAnt使ってるはず。Mavenはしらね。
### Antを使う {#teda2b23}

### Maven2を使う {#zafa1d4e}
