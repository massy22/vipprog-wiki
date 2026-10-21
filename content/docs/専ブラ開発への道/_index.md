---
title: "専ブラ開発への道"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "専ブラ開発への道"
draft: false
---

# 2chの色々なこと {#t1c26a5b}


```
＿＿＿＿＿＿＿＿
　　＜○√　 ＜しまった、ここは糞ページだ！
　　 　∥ 　 　 　オレが止めているうちに他サイトへ逃げろ！
　　　くく 　　　　早く！早く！オレに構わず逃げろ！
```

- http://age.s22.xrea.com/talk2ch/
- http://info.2ch.net/wiki/index.php?monazilla%2Fdevelop
- http://www.monazilla.org/

~<br />

## 掲示板サーバの中身 {#m55701a5}
2chの掲示板鯖の基本的なファイル配置はこうなっています（外から見える範囲かつ、主な物だけ）


```
yutori7.2ch.net
　|
　|──news4vip（言わずと知れたニュー速VIP）
　|　　　　|──index.html（IEで板を開いたときに出てきます）
　|　　　　|──subject.txt（生きているスレのスレタイとスレ番が入ってます）
　|　　　　|──subback.html（↑と内容は同じ。形式が違う）
　|　　　　|──setting.txt（板の設定値（板名とか、本文の行数の上限とか、連投規制値）が入ってます）
　|　　　　|──1001.txt（1001の内容っす）
　|　　　　|──head.txt（ローカルルールの原本がここに）
　|　　　　|──dat（生きているスレのdatが入っとります）
　|　　　　|　　 |──1172740677.dat
　|　　　　|　　 |──1172766831.dat
　|　　　　|　　 |──1172832524.dat
　|　　　　|　　 |　　　　　・
　|　　　　|　　 |　　　　　・
　|　　　　|　　 |　　　　　・
　|　　　　|
　|　　　　|
　|　　　　└──kako（過去ログがたんまりと。面倒だから説明は後々…）
　|
　|──news4plus（東亜＋）
　|
　|──yutori7tr（ゴミ箱）
　|　　　　・
　|　　　　・
　|　　　　・
　|　　　　
　|──_service
　|　　　|
　|　　　|──bbslist.txt（その鯖の板一覧が入ってます）
　|　　　|──数字八桁.txt（10分毎のLAが見れます）
　|　　　|──PV数字八桁.txt（1時間毎のPVが見れます。http://qb5.2ch.net/operate/1104955745/193）
　|　　　└──IPnum-(ry.txt（規制関連のデータだったと思います。。。）
　|
　|
　|
　└──test
　　　　　|──bbs.cgi（レスとスレ立てに使います）
　　　　　|──read.cgi（datフォルダのdatをhtmlに整形してクライアントに返します）
　　　　　|──read.html（↑と同じ動作をするjavascriptが含まれたhtmlを返します）
　　　　　|──offlaw.cgi（dat落ちしたスレを取得する際に使います）
　　 　 　|──subbbs.cgi（スレ立てに使ってましたが、現在は廃止されています）
　　 　 　|──r.i（携帯でのアクセスに使ってましたが、現在は（ｒｙ）
　　　  　|──p.i（携（ｒｙ現（ｒｙ）
　 　　 　|──headad.txt
　 　　　 |──putad.txt
　 　　　 |──bbs-yakin.cgi
　 　　　 |──flash.txt
　　　　  └aho┬gonta_oxy.cgi
　　　　 　　　└gonta893.cgi
```


## 鯖リスト {#fe979f22}
2chのボランティアである[root★氏のサイト](http://mumumu.mu/serverlist.html)が一番新しく確実です。

もしくは、[2chの板リスト](http://www.2ch.net/bbsmenu.html)から。

## スレの読み方 {#o6b1ada6}
read.cgiを叩かずに、datを直読みしましょう。

datは2008年現在、<br />
1行目が、

```
名前<>メール欄<>年/月/日（曜） 時:分:秒.下二桁（無い板もある） ID:hogehoge0<> 本文 <>スレタイ
```


2行目以降が、

```
名前<>メール欄<>年/月/日（曜） 時:分:秒.下二桁（無い板もある） ID:hogehoge0<> 本文 <>
```

の形で記録されています。<br />
本文内では、<>"がエスケープされて、改行は<br>であらわされています。またIDの部分にBeや●等がついていたりします。

HTTPでのリクエストの方法は、

```
GET /news4vip/dat/11111111111.dat HTTP/1.0
Host: takeshima.2ch.net
User-Agent: Monazilla/1.00
Connection: close
(空行！)

```

こんな感じです。<br />
余裕が有るなら、下の方で書いてある差分取得も実装しましょう！


## bbs.cgiの叩き方 {#adb49020}

[と～く２ちゃんねるさん](http://age.s22.xrea.com/talk2ch/)を<del>パクｒ</del>今風に改変&抜粋しています。<br />
許可とか取ったほうが良いかな……？

とりあえずHTTPリクエストの例（VIPのhttp://yutori.2ch.net/test/read.cgi/news4vip/1217356258/に、
名前欄はデフォ、目欄はsageでhogehogeと書き込みます）


```
POST /test/bbs.cgi?guid=ON HTTP/1.1
Host: takeshima.2ch.net
Content-length: 95
Referer: http://takeshima.2ch.net/news4vip/
User-Agent: Monazilla/1.00
Connection: close

bbs=news4vip&key=1217356258&time=1&submit=書き込む&FROM=&mail=sage&MESSAGE=hogehoge&suka=pontan

```

詳細は、後述の「簡単なまとめ」を見てください。<br />
で、こんな感じでポストすると…

```
HTTP/1.1  200 OK
Date: Wed, 30 Jul 2008  12:25:17 GMT
Server: Apache/2.0 .59 (Unix) PHP/5 .2.5 mod_ssl/2.0 .59 OpenSSL/0.9. 7e-p1
Set-Cookie: PON=hogehoge; expires=Friday, 01-Jan-2010 00:00:00 GMT; path=/
Set-Cookie: HAP=fugafuga; expires=Friday, 01-Jan-2010 00:00:00 GMT; path=/
Vary: Accept-Encoding
Content-Length: 1076
Connection: close
Content-Type: text/html
以下略
```


こんな感じのが帰ってきます。<br />
重要なのはここ<br />
＞Set-Cookie: PON=hogehoge; expires= Friday, 01-Jan-2 010 00:00:00 GMT ; path=/<br />
PON=の後には自分のホスト名が入っています。<br />

んで、この帰ってきたPON以下を、

```
POST /test/bbs.cgi?guid=ON HTTP/1.1
Host: takeshima.2ch.net
Content-length: 111
Cookie: PON=hogehoge;HAP=fugafuga
Referer: http://takeshima.2ch.net/test/bbs.cgi?guid=ON
User-Agent: Monazilla/1.00
Connection: close

bbs=news4vip&key=1217356258&time=1&submit=上記全てを承諾して書き込む&FROM=&mail=sage&MESSAGE=hogehoge&suka=pontan

```

こんな風に組み入れて再度POSTすれば書き込めます。<br />
自分のIPが変わるまではCookieの中身を流用できます。<br />
IPが変わったら再度Set-Cookieヘッダが付いてきます。<br />

Set-Cookie:の内容を単純に全部組み込んでも構いません。↓

```
Content-length: 161
Cookie: PON=hogehoge; expires=Friday, 01-Jan-2010 00:00:00 GMT; path=/
Cookie: HAP=fugafuga; expires=Friday, 01-Jan-2010 00:00:00 GMT; path=/
Referer: http://yutori.2ch.net/news4vip/
```

### 簡単にまとめ {#p430350e}

```
POST /test/bbs.cgi?guid=ON HTTP/1.1
Host: 書き込みたい板のある鯖（namidame.2ch.net等）
Content-length: ポストするデータのサイズ(バイト)
Referer: 書き込みたい板のURL（http://namidame.2ch.net/news等）
User-Agent: Monazilla/1.00（ここは慣例）
Cookie: NAME=名前; MAIL=メール; SPID(PON)=値; expires=有効期限; path=/（NAMEとかMAILに値が入っていると、フォームにデフォで中身が入ってます。）
Connection: close（１回の送受信で切断するという意味）
（ここは改行）
bbs=板名&key=スレッド番号（スレが立った瞬間のUNIXTIME）&time=1&submit=書き込む（ここは弄らずに）&FROM=名前（名前欄の内容）&mail=sage（目欄の内容）&MESSAGE=本文（そのまんま） &suka=pontan
（もう一度改行）
```


書き忘れてましたが、名前欄の内容、目欄の内容、本文の内容、<br />
そしてsubmit=「書き込む」はちゃんとURLエンコードしてくださいね。<br />
20090108追記：ちなみに、Hostヘッダにポート番号を指定しちゃうと書き込めないよ！！

ConnectionはKeep-Aliveが有効な鯖とそうでない鯖が混在してます。確か。<br />

## 鯖にやさしい漢になろう {#m607d19c}
鯖の負荷、転送量を考えたコーディングを行いましょう。<br />
例を挙げますと、<br />
・連続更新の自主規制<br />
・差分取得の実装<br />
・gzip圧縮への対応<br />
等になります。<br />

### 連続更新の自主規制 {#j83e6aab}
読んだまんまです。<br />
Janestyle等では、同時にアクセスできるスレッドがデフォルトでは3つまでだったり、<br />
3秒待たないと同じスレッドを更新できないようになっています。<br />

俺しか使わねーから良いじゃんｗｗｗｗと思ってる人も、<br />
リロードバーボンが実装されましたので、アクセスしすぎると[ボボンハウス](http://www2.2ch.net/403/)送りとなります。<br />
### 差分取得 {#wc9b2266}
これは、datをリクエストする時、HTTPヘッダに「If-Modified-Since」「range」を付ける事により、<br />
更新が無い時には再受信せず、更新があるときでも前回読み込んだ場所の終わりから受信するという高等テクニックです。<br />
例えば、前回の受信日時が2008/7/30 12:12:12で、<br />
スレッドを3050バイトまで受信したときは、

```
If-Modified-Since: Wed, 30 Jul 2008 12:12:12 GMT
Range: bytes=3050-
```

という二行を足してやればおｋです。<br />
このとき、If-Modified-Since:の右側には前回取得した時の

```
Last-Modified: Wed, 30 Jul 2008 12:12:12 GMT
```

の右側をそのまま与えてください。<br />
更新が無かった場合は304 Not Modifiedが返ってきます。

またこの手法を使う際は更新があったか無かったかの他に、あぼんはあったか？というのを判定する必要があります。（あぼんがあったらdatサイズが減る場合があるため）<br />
方法は色々ありますが、個人的にはRangeヘッダには前回受信したバイトから1を引いた数を入れ、<br />
新しく受信したデータが改行コードから始まっているかどうかを見る方法が好きです。ただし, この方法でもあぼんが行われたにもかかわらず運悪く偶然受信したデータが改行コードから始まる可能性はあるので万全というわけではありません。<br />
なお、あぼんによってサイズが減っている場合は

```
416 Requested Range Not Satisfiable
```

が返ってきますので、全部取得しなおしてください。

### gzip圧縮への対応 {#g44b3eae}
datにアクセスするときに、

```
Accept-Encoding: gzip
```

をヘッダに加えます。すると

```
Content-Encoding: gzip
```

というヘッダーが返って来て、datが gzip圧縮された状態で返されます。
そのままパイプか何かでgzipに流すかzlib等を使って解凍すると、Accept-Encoding: gzipをつけなかった時と同じ内容になります。

必ずしも圧縮されて返ってくるわけではない（差分取得の時等）ので、Content-Encoding: gzipがあることを確認してから解凍しましょう。

# 開発言語 {#hb76bf56}

```
   154 名前：以下、名無しにかわりましてVIPがお送りします[sage] 投稿日：2011/01/20(木) 13:21:10.15 ID:wSoJfg1qP
   専用ブラ作りたい場合はどの言語がいいの？ 
   156 名前：以下、名無しにかわりましてVIPがお送りします[] 投稿日：2011/01/20(木) 13:30:08.71 ID:q5l5otsA0
   twintail…Ｃ♯
   V2C…Java
   Jane系…Delphi
   かちゅーしゃ…C(転載注:Delphiです)
   160 名前：以下、名無しにかわりましてVIPがお送りします[sage] 投稿日：2011/01/20(木) 14:20:55.94 ID:6G249Zm70
   Live2ch…VB
   p2/rep2…PHP
```


Delphiは個人的に将来性が若干怪しい気が…（ただし開発元はやる気マンマン）そういやjaneのc++移行ってどうなった？<br />
↑自己解決、JaneLovely（開発停止）の作者がやってたけどお察しください。
