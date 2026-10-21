---
title: "C Sharp"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "C-Sharp"
draft: false
---

# プログラミング言語 C# {#h266c3bc}


# 言語の特徴 {#a6035d70}
C#はMicrosoftが.NET Frameworkでの中心言語とすべく開発した新しい言語<br />
過去のいろいろな言語を参考にしているので評判が割りとよい<br />
開発環境は無料ですし、GUIアプリも、Webアプリも、ゲームだって効率よく作成できます。<br />
C#はJavaと同じような中間言語方式です。それが何なのはググれ<br />

Windowsで動くものはもちろん、XBOX360やLinux、Windows Mobileなどがあります。<br />
（ただし作ったものなら何でも、どこでも動くというわけではない）

VB.NETとは大変似ており、同じ.NETで動く言語ですから大体の場合予約語を入れ替えるだけで読めるようになります。<br />
[VB.NET、C#変換表](http://dobon.net/vb/dotnet/vb2cs/vb2cstable.html)を参照してください。

# 開発環境の導入 {#c8aabc8b}
Microsoft社が初心者向けに無料で提供しているVisual C# 2008 Express Edtion（以下Visual C#）を使用するのが簡単です。<br />
<span style="color:green;">だが今ではVisual studio2010無料バージョン</span>があるので
わざわざC#3.0が前提の2008を使う意味は全くない。さっさと2010を使用汁
ただし、Visual C#はWebインストールの場合はユーザー登録が必要です。<br />
それが嫌な方は、isoイメージからインストールすることができます。<br />
また、IDEのような大きなソフトをインストールしたくない方はコンパイラといくつかのツールがセットになった.NET Framework 3.5 SDKをインストールしてもいいでしょう。<br />

## 学生または教職員の場合 {#x96ad539}
学生または教職員の場合、マイクロソフト製品を安く買うことが可能です。<br />
高校生以上の学生の方は[Microsoft Dream Spark](http://www.microsoft.com/japan/academic/dreamspark/default.mspx)によって，Visual Studio(なんとProfessional)やWindows Serverなどの製品を無料で手に入れることができます．

大学生の場合は大学や研究室がMSDNに加入している場合があり、無料で手に入れることができるかもしれません。<br />
まずは問い合わせをしてみましょう。Vistaとかタダで手に入りますよ。<br />

以下、それぞれのインストール方法について説明します<br />

## Visual C# 2008 Express Edtionの場合 {#q60459fe}
新しくVisual C# 2008が登場しました。これからはじめる場合これを選んでおけば間違いないでしょう。<br />
（2005もありますが、これはらはじめるのにあえて選ぶ理由はありません）<br />

[Visual Studio 2008 Express Editions](https://www.microsoft.com/japan/msdn/vstudio/express/)のページよりインストールするだけです。<br />
[はじめての方のためのVisual C# 2008 Express Edition インストール方法紹介](https://www.microsoft.com/japan/msdn/vstudio/express/beginners/2008/vcsharp.aspx)<br />
にも詳しく紹介されていますのでこちらもご覧下さい。<br />

isoイメージからインストールする場合、[ここ](http://www.microsoft.com/japan/msdn/vstudio/express/maninstall/)を参考にしてください。<br />
isoイメージからなんらかのソフトウェアでファイルを展開します。インストール自体はWeb版と同様です。こちらの場合、ユーザー登録が必要ないようです（本スレJavaの人より。多謝）。<br />

ドキュメントとして「[MSDN Express Library](http://download.microsoft.com/download/5/7/b/57b8cf33-4cb4-466d-aca1-e4b1f64a3508/msdnixp.exe)」があります。<br />
なるべくならこれもインストールしておきましょう。


[IDE（統合開発環境）なんて軟弱なものはいらねぇぜという方はこちら](/docs/プログラミング言語/C-Sharp/IDEなんていらない)

# C#チュートリアル {#t454dfe2}

- [C#チュートリアル](/docs/プログラミング言語/C-Sharp/CSharpチュートリアル)


## ちょっとGUIアプリを作ってみましょうか {#ce797091}

- [アナログ時計を作ろう](/docs/プログラミング言語/C-Sharp/アナログ時計を作ろう)
- [CPU使用率メータ](/docs/プログラミング言語/C-Sharp/CPU使用率メータ)


# 参考文献 {#n3993ce9}
## 参考サイト {#u4b676a8}
### MSDN {#see27f4b}

- [Visual C# 2008, Visual C# 2005 | Visual C# デベロッパー センター | MSDN](http://msdn.microsoft.com/ja-jp/vcsharp/default.aspx)
  - [Visual C# スタート キット](http://msdn.microsoft.com/ja-jp/vcsharp/aa336742.aspx)
  - ラーニング - 初めてアプリケーションを作成するのに役立つリソース
- [Code Recipe -.NET 開発サンプル コード集- Visual Studio 2008 対応版 | MSDN](http://code.msdn.microsoft.com/ja-jp) - .NET 開発に関するサンプル コードを集めた開発レシピ集。10 行コードでズバリ（サンプルコード）、300 でズバリ（解説動画） etc.
- [Microsoft Visual Studio 2008 Express 学習情報](http://www.microsoft.com/japan/msdn/vstudio/2008/product/express/learn.aspx) - 自分にあった教材をチョイス
- [C# プログラミング ガイド](http://msdn.microsoft.com/ja-jp/library/67ef8sbd.aspx) - C# および一般的なプログラミングの概念について既にある程度の知識を持っているユーザー対象


### C#入門 {#vfc20c6b}

  - 初心者向け
    - [C# によるプログラミング入門](http://ufcpp.net/study/csharp/)
  - プログラミング経験者向け
    - [@IT 連載 改訂版 C#入門](http://www.atmarkit.co.jp/fdotnet/csharp_abc2/index/index.html)

### Tips、テクニック集 {#reae0a44}

  - [C#，VB.NET入門](http://jeanne.wankuma.com/)
  - [C# Tips](http://www.woodensoldier.info/computer/CSharp.htm)
  - [矢沢久雄の早わかりGoFデザインパターン](http://itpro.nikkeibp.co.jp/article/COLUMN/20051201/225570/)
  - [The Code Project](http://www.codeproject.com/) (English)

~英語だけど膨大なサンプルが魅力。コントロールとかいっぱいそろっていてとても便利。日本語でひっかからない時は探してみる価値あり。

## 参考書籍 {#rb492f41}
### C#入門 {#bb491baa}

- 初心者向け
  - 独習C# 第2版（ハーバート・シルト著、翔泳社）


- プログラミング経験者向け
  - プログラミングC# 第4版（Jesse Liberty　著、オライリー）
