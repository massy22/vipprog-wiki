---
title: "SQL"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "SQL"
draft: false
---

[プログラミング言語](/docs/プログラミング言語)

# SQL {#n5bc80f0}

データベース(特にRDBMS)を操作するために使われる言語。<br />
標準規格はあるものの、各RDMBSの独自仕様も多い。<br />

## RDBMSって？ {#te32579b}

関係データベース管理システム(Relational Database Management System)。関係モデルに基づいてデータを持つ。<br />
超簡単に言うと、excelで作るような表形式（テーブルと呼ばれる）でデータを持つということ。<br />
<br />
表形式なので、データを取得する場合は行と列を選択する。<br />
RDBMSでは列を列名、行を主キー（Primary Key、よくPKと略される）の値で選択する。<br />
<br />
主キーとは、データが絶対に重複しない列のこと。<br />
出席番号、社員番号、ログインIDなんかをイメージすると良いかも。<br />

## なんでRDMBSが使われてるの？ {#g472f3a3}

主な理由は大量のデータを取り扱えて性能がいいから。<br />
プログラム中で処理とデータを分けることはよくあるのだけど、大量にデータがあるとCSVみたいなテキストファイルでデータを管理するのは無理。<br />

## 主なRDBMS {#gba75dd0}

RDMBSは各ソフトウェアによって微妙な差異が結構ある。<br />
性能を気にする場合などは各RDBMSの仕様を確認しよう。<br />

- Oracle <br />
  有料（高い）。資格試験もある。非商用利用に限り無料版が提供されている。商用で使う場合はデファクトスタンダード。~<br />
  Oracle10g Express(Free Version)<br />
  http://www.oracle.com/technetwork/database/express-edition/downloads/index.html
- MySQL <br />
  オープンソースのRDBMS。Javaを開発したSun Microsystemsが提供していたが、Oracleに買収された。無料で使えるDBとしてはデファクトスタンダード。~<br />
  http://www.mysql.gr.jp/<br />
  http://dev.mysql.com/downloads/
- PostgreSQL <br />
  オープンソースのRDBMS。日本でよく使われている。~<br />
  http://www.postgresql.jp/
- Microsoft SQL Server <br />
  Microsoftが提供しているRDBMS。無料版もある。VisualStudioをインストールすると一緒に入ってくる場合がある。エディタもあるので使いやすい。~<br />
  MS-SQLServer 2008Express<br />
  http://www.microsoft.com/downloads/details.aspx?familyid=58CE885D-508B-45C8-9FD3-118EDD8E6FFF&displaylang=ja~<br />
  MSDE2000<br />
  http://www.microsoft.com/japan/sqlserver/2005/msde/default.mspx
- DB2 <br />
  IBMが提供しているRDBMS。
- SQLite <br />
  アプリ組み込み用。単体版もある。EXEファイル１個だけなので気軽に使える。~<br />
  http://www.sqlite.org/

## SQLの使い方 {#b2ce284a}

SQLを使うためには、まずDBをインストール。<br />
各SQL文はOracleを使う前提で書いてるので、他のDBを使う場合は型を適当に読み替えてください（＞＜）
<br />
### テーブルの作成 {#oe0a478d}
まずvipperidとvippernameを持つvipperというテーブルを作ってみる。


```
CREATE TABLE vipper(
 vipperid INT(9, 0) PRIMARY KEY,
 vippername VARCHAR(20)
);
```


CREATE Table \[テーブル名](列名 型, 列名 型, ・・・）でテーブルを作ることができる。<br />
vipperidはINT型で最大9桁、vippernameは文字列型で最大20文字。<br />
「PRIMARY KEY」と後ろに書かれているvipperidが主キー。<br />

## データの追加 {#ha27ed84}
データはINSERT文を使って挿入する。


```
INSERT INTO vipper(vipperid, vippername) VALUES(1, 'ブーン');
INSERT INTO vipper(vipperid, vippername) VALUES(2, 'vipper');
INSERT INTO vipper(vipperid, vippername) VALUES(3, '（＾ω＾）')
```


INSERT INTO \[テーブル名](列名1, 列名2, ・・・) VALUES(列名1の値, 列名2の値, ・・・);<br />
文字列は「'」で囲む必要あり。他のデータを入れる場合は主キーのvipperidがかぶらないようにね。主キーがかぶったデータを入れようとすると・・・？<br />
データ挿入後はこんな感じ。<br />

|vipperid|vippername|
|---|---|
|1|ブーン|
|2|vipper|
|3|（＾ω＾）|

## データの参照 {#ee61d329}
SELECT文を使ってデータを参照<br />
<br />
テーブルの全てのデータを参照

```
SELECT * FROM vipper;
```


取得データ

|vipperid|vippername|
|---|---|
|1|ブーン|
|2|vipper|
|3|（＾ω＾）|

指定した列だけ参照（この場合はvippernameだけ）

```
SELECT vippername FROM vipper;
```


取得データ

|vippername|
|---|
|ブーン|
|vipper|
|（＾ω＾）|

特定の行だけを参照

```
SELECT vipperid, vippername FROM vipper WHERE vipperid = 1;
```


取得データ

|vipperid|vippername|
|---|---|
|1|ブーン|

## データの更新 {#a8088778}
UPDATE文を使って更新


```
UPDATE vipper SET vippername = 'vippest' where vipperid = 2;
```


データ更新後

|vipperid|vippername|
|---|---|
|1|ブーン|
|2|vippest|
|3|（＾ω＾）|

※注意 whereで更新する行を絞らないとvipperテーブルの全データが更新される！

## データの削除 {#o2b7381f}
DELETE文を使って削除


```
DELETE FROM vipper WHERE vipperid = 3;
```


データ削除後

|vipperid|vippername|
|---|---|
|1|ブーン|
|2|vippest|

※注意 DELETE文もWHEREで行を絞らないと、全データ削除される！
