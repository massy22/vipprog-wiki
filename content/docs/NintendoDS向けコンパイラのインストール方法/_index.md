---
title: "NintendoDS向けコンパイラのインストール方法"
date: 2023-03-02T22:15:44+09:00
lastmod: 2023-03-02T22:15:44+09:00
slug: "NintendoDS向けコンパイラのインストール方法"
draft: false
---

# NintendoDS向けコンパイラのインストール方法 {#k4a2f0c7}
手順１．コンパイラのダウンロード
海外の本家サイトからは面倒なのでここからダウンロード汁
<del>http://www8.uploader.jp/dl/vipprog/vipprog_uljp00059.exe.html </del> (消失)

手順２．インストール
（手順１）でダウンロードした「devkitProUpdater-1.4.4.exe」を実行
Nextを5回、Finishを1回押したあと1分ぐらいまでばインストール完了
「C:\devkitPro」ってフォルダが出来てたら成功

手順３．サンプルをビルドする
コマンドプロンプトで「C:\devkitPro\examples\nds」に移動して「make」って
打てば数分間でサンプルがビルドされる
「C:\devkitPro\examples\nds\bin」に「hello_world.nds」や「lesson01.nds」
っていうファイルがあれば成功

※失敗した場合
　他の開発環境がすでにインストールされていると失敗する可能性がある
　C言語系やDelphiあたりは競合しやすい
　その場合は環境変数「Path」の「c:\devkitPro\msys\bin;」が
　最初に来るように変更する

手順４．サンプルを実行
NO$GBAでも使ってエミュで実行するかR4で実機で実行すればいい

以上
