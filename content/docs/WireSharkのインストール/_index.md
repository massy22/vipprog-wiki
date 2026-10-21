---
title: "WireSharkのインストール"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "WireSharkのインストール"
draft: false
---

# WireSharkのインストール {#m976cf71}

## 概要 {#re11a413}
WireSharkは通信ソフトがどんな内容をやり取りしているのか見るツールです<br />
IEがどんな通信しているのかを見る→解析→2chブラウザを作る<br />
みたいな感じで使います<br />

## 手順１．ダウンロード＆インストール {#i4b8ddf0}
http://prdownloads.sourceforge.net/wireshark/wireshark-setup-0.99.6a.exe <br />
デフォ設定で問題なし<br />
WinCapとかいうのも同時にインストールされるが気にせず入れる<br />

## 手順２．設定 {#sececf50}
２－１．スタートメニューからWireSharkを起動する<br />
２－２．Edit -> Preferences...を選ぶ<br />
２－３．Captureを選ぶ<br />
２－４．Default Interfaceで自分が使っているNICを選ぶ<br />
２－５．OKを押す<br />

## 手順３．キャプチャーしてみる {#s666e077}
３－１．Capture -> Start<br />
３－２．（キャプチャーしたい通信ソフトを動作させる）<br />
３－３．Capture -> Stop<br />
３－４．適当にクリックするとそのデータを見ることができる（Stop前でも見える）<br />
３－５．TCPの場合は適当なデータを右クリックして<br />
　　　　Follow TCP Streamで連続したデータとしてみることができる<br />

以上<br />
