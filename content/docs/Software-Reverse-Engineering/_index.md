---
title: "Software Reverse Engineering"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Software-Reverse-Engineering"
draft: false
---

# 目次 {#f78671f0}


# Software Reverse Engineeringとは？ {#r9af38d8}
## Wikipediaさんに聞いてみた {#eae806d2}
> [http://ja.wikipedia.org/wiki/%E3%83%AA%E3%83%90%E3%83%BC%E3%82%B9%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%83%AA%E3%83%B3%E3%82%B0 リバースエンジニアリング - Wikipedia]
>> リバースエンジニアリング（Reverse engineering）とは、機械を分解したり、製品の動作を観察したり、ソフトウェアを解析するなどして、製品の構造を分析し、そこから製造方法や動作原理、設計図、ソースコードなどを調査する事である。

つまりソースコードが手に入らない状況でソフトウエアの振る舞いを解析すること。


## 何が楽しいの？ {#e95d7882}

- Crackmeといわれる解析の練習用のプログラムを解析して腕を競う。
- こいつバグだらけだよｗｗｗｗｗｗﾌﾟｷﾞｬｰｗｗｗｗｗｗと悦にいる。
- なにこのソフトｗｗｗ文字列単純比較ｗｗｗと(ry


# Crackme {#o2de8000}

- 募集中


# 便利なツール {#zf12609f}

|Filemon|ファイルアクセス監視ツール|
|---|---|
|Regmon|レジストリアクセス監視ツール|
|PEiD|PEヘッダーを見てパックされてるかとかをチェック！|
|PEditor|PEヘッダーを編集するツール|
|Ollydbg|高性能で使いやすいデバッガ。|
|Fire Flower|パッチを当てるツール。この形式が最もよく使われてるかな。|
|DeDe|Delphi専用デバッガ|
|QuickBe|バイナリエディタ。FireFlower形式のパッチを当てる機能もある。|
|Reflector|.NET製アプリをデコンパイル|
|[http://www.hex-rays.com/idapro/idadownfreeware.htm IDA Pro Freeware Version]|静的解析に用いる逆アセンブラ。|
|Jad|Javaのクラスファイルからソースコードを復元する逆コンパイラ。一時配布元が消えているので[Internet Archive](http://web.archive.org/web/20080214075546/http://www.kpdus.com/jad.html#download)を漁るか[Pleiades](http://mergedoc.sourceforge.jp/)の同梱のものを用いる必要がある。|
|スペシャルねこまんま57号|プロセスメモリエディタ兼デバッガ|
|うさみみハリケーン|同じくプロセスメモリエディタ兼デバッガ|

# チュートリアル {#m2dd4dae}
リバースエンジニアリングのチュートリアル。
## Ollydbg導入 {#v536b1b3}
解析では主にOllydbgを用いる。
ここではそれを導入する手順を説明する。

1. http://www.ollydbg.de/からOllydbgのバージョン1.10をダウンロードする。
1. http://hp.vector.co.jp/authors/VA028184/から日本語化パッチをダウンロードし、手順に沿って日本語化する。


これだけだ。


# 参考書 {#dffd6f77}

- [http://www.amazon.co.jp/dp/4798017051/ デバッガによるx86プログラム解析入門—コンピュータとプログラムの仕組みを覗く]


# リンク {#v856ff57}

- [http://crackmes.de/ Crackmes.de]
- [http://ruffnex.oc.to/kenji/ KENJI'S HOMEPAGE]
- [http://wizardbible.org/ Wizard Bible]
- [http://itpro.nikkeibp.co.jp/article/Watcher/20061004/249805/ セキュリティとリバース・エンジニアリング：鵜飼裕司のSecurity from KAGURAZAKA：ITpro]
- [RCE Japan](http://security.symphonic-net.com/rcejp/index.php?sid=65eee73755de641b74a2c1658a4326e8)
  - [フォーラム閲覧 - 初心者向け講座](http://security.symphonic-net.com/rcejp/viewforum.php?f=16&sid=65eee73755de641b74a2c1658a4326e8)（閲覧のみ） が [ゲストにも解放されたようです。](http://security.symphonic-net.com/rcejp/viewtopic.php?f=5&t=41&sid=65eee73755de641b74a2c1658a4326e8)


- [http://itpro.nikkeibp.co.jp/article/COLUMN/20070927/283156/?ST=security ITpro ホワイトハッカー道場]
