---
title: "D"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "D"
draft: false
---

# プログラミング言語D {#o6306037}


## はじめに {#s9206115}
D言語使いには度重なる仕様変更で気持よくなっちゃうドMの精神が求められます<br />
また破壊的仕様変更がされたようですFUUUUUUUUUUU!!!!!!!!

## 言語の特徴 {#y3d8d576}

- [C](/docs/プログラミング言語/C)言語の後継を目指して作られた言語
  - [C++](/docs/プログラミング言語/C--)と[C#](/docs/プログラミング言語/C-Sharp)と[Java](/docs/プログラミング言語/Java)のいいところをあわせて作ったような感じ
- ネイティブ出力
- コンパイル速度は速め
- GCがある
- マルチプラットフォーム(Windows、Mac OS X、Linux32、Linux64、FreeBSD)


## バージョンの違い {#w4b1507d}

<dl>
  <dt>D1</dt>
  <dd>安定版で、2012年でサポートが終わる<br /></dd>
</dl>

クロージャがクロージャじゃなかったりするが、バグじゃなく仕様です

<dl>
  <dt>D2</dt>
  <dd>開発版で、仕様がころころ変わる<br /></dd>
</dl>

普通はこっちを使う

<dl>
  <dt>D3</dt>
  <dd>2009年の11月に仕様が固まる予定(2011年2月現在)</dd>
</dl>


## コンパイラのダウンロード {#pb06c7c0}
ここではD2を使うことにします

- [公式](http://www.digitalmars.com/d/download.html)からdmd.2*.zip(2.052ならdmd.2052.zip)をダウンロード
  - Ubuntuとかならパッケージからインストール可能
- 自由なフォルダ（ここではC:\とします）に展開
- C:\dmd2\binにパス通してdmdとコマンドを打てばバージョン情報が表示される


### 動作チェック {#je86501e}

- 適当なファイル(ここではwork.d)に以下を保存


```
import std.stdio;
void main() {
  writeln("Hello, Work!");
}
```

- dmd work.d とコマンドを打ってハローワークへGo
- オプションとして -run を与えるか rdmd を使うとコンパイルの途中で作られたファイルは残らなくなる


## IDE(Visual D)を使う {#t0164f89}
[いろいろなIDE](http://dusers.dip.jp/modules/wiki/?Tools#u443a8ec)があるが、ここでは超頻繁に更新されているVisual Dを使うことにする<br />
Visual Dを使うと、Visual Studio(注:Expressではない)でDのプロジェクトが扱えるようになる<br />
もしVSを持っていなくても[Visual Studio Shell](http://www.microsoft.com/downloads/details.aspx?displaylang=ja&FamilyID=8e5aa7b6-8436-43f0-b778-00c3bca733d3)が無料で使える<br />

- [公式](http://www.dsource.org/projects/visuald)からインストーラをダウンロード、インストール
- VSを起動し、ツール→オプション→プロジェクトおよびソリューション→Visual D Settings でコンパイラのディレクトリ(上の例ではC:\dmd2)を指定する
  - コンパイルオプションはプロジェクトのプロパティで変更可能
- ファイル→新規作成→プロジェクト にD言語が追加されている
- プロジェクトにはサンプルプログラムが付いており、そのままコンパイル出来る


### Visual Dの機能 {#gb38e5b2}

- 色分けはもちろん、オートインデントやブロックの折りたたみ、変数名の補完にも対応している
- Phobos(標準ライブラリ)の関数なら「定義へ移動」も出来るし、パラメータ情報も利用できる
- デバッグ機能としてはブレークポイントもあるし、変数の中身も覗ける
- C++からの変換(大して使えない)が出来る


## リンク {#vf0d43a1}
### 本家 {#y0837585}

- [DigitalMars社](http://www.digitalmars.com/) コンパイラ出してるとこ
- [公式ドキュメント](http://www.d-programming-language.org/)
  - [日本語訳](http://www.kmonos.net/alang/d/2.0/)
- [Phobos](http://www.d-programming-language.org/phobos/phobos.html) 標準ライブラリの公式ドキュメント
  - [日本語訳](http://www.kmonos.net/alang/d/2.0/phobos/phobos.html)


### 参考サイト {#cdef1fe4}

- [わかったつもりになるD言語](http://www.kmonos.net/alang/wnd/) 通称わなD
- [D言語友の会](http://dusers.dip.jp/) Wikiやフォーラム
- [D言語Wiki](http://www22.atpages.jp/~dwiki/) D言語のWiki
