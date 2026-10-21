---
title: "IronPython"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "IronPython"
draft: false
---

# こんな特徴があります {#sd1f9090}
IronPythonはスクリプト言語[Python](/docs/プログラミング言語/Python)の.NET Framework上での実装です。
なので、言語自身の特徴としてはPythonと似ています。
IronPython独自の特徴として

- 1.1系はPython2.4系と互換、2.0系ではPython2.5系と互換、2.6系ではPython2.6系と互換、2.7系ではPython2.7系と互換
- 2.0以降はSilverlightアプリケーションを開発可能
- .NET Frameworkのクラスライブラリにアクセス可能
- .NET上の各言語からIronPythonをスクリプトエンジンとして使用可能
- .NETの各言語同様コンパイルして.NETアセンブリ（exeやdllのこと）を生成可能
- IronPython自身、C#で記述された.NET アプリケーション


などがあります。これらの特徴は「.NET Framework上で動作する」ということに起因します。
少し駄目な点として

- 現在最新のPythonであるPython3.x系はまだサポートしてない
- Pythonのライブラリのうちいくつかはサポートしてない
- 日本語の情報が少ない


とはいえ、まだまだPython 2.x系が主流ですし
ライブラリについては膨大な.NET Frameworkのライブラリにアクセスできるのであまり気にする必要はありません。
さらに、現在も精力的に開発が続いているため、上記の欠点（というほどでもないですが）もしだいに改善されていくでしょう。

興味を持ってもらえたでしょうか。
ここまで余り興味を持てなかった人も、「すごさを体感しましょう」の項まで進めば、きっとIronPythonのとりこになるはずです。

さあ、IronPythonでプログラミングにチャレンジしてみましょう！

# 準備をしましょう {#k7d242ca}
## .NET Frameworkをインストールしてありますか？ {#pd813fa6}
IronPythonは実行に.NET Frameworkが必要です。まだインストールいていない方はインストールしましょう。<br />
1.1では.NET Framework 2.0のみの対応。2.0では.NET Framework 2.0と3.0に対応。<br />
2.6.1では.NET Framework 2.0 SP1～3.5対応のものと4.0対応のものが用意されています。<br />
それ以降のバージョン（2.6.2及び2.7）では.NET Framework 4.0でしかきません。
Monoでも動きます。<br />
すでにインストールしてある方は次のIronPythonのダウンロードとインストールにすすんでください。

.NET FrameworkはWindows Update（またはMicrosoft Update）からインストールするか、自分でインストーラをダウンロードしてインストールします。

### Window Updateからインストールする場合 {#af786fde}

1. [Windows Update](http://windowsupdate.microsoft.com/)に行き、ページが表示されたら「カスタム」を選びます
1. 「追加選択（ソフトウェア）」をクリックします
1. 追加できるソフトウェアの一覧が表示されるので、.NET Framework 2.0にチェックを入れます
1. 「更新プログラムの確認とインストール」をクリックします
1. .NET Framework 2.0が選択されていることを確認して、「更新プログラムのインストール」をクリックしてインストールします


### インストーラからインストールする場合 {#cc1445aa}
以下はx86の方向け（つまり、ほとんどの方向け）の説明です。64ビットWindowsを使用している方は、注意してください。

1. [Microsoft .NET Framework Version 2.0 再頒布可能パッケージ (x86)](http://www.microsoft.com/downloads/details.aspx?familyid=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=ja)からダウンロードしてインストールします
1. [Microsoft .NET Framework 2.0 日本語 Language Pack (x86)](http://www.microsoft.com/downloads/details.aspx?familyid=39C8B63B-F64B-4B68-A774-B64ED0C32AE7&displaylang=ja)からダウンロードしてインストールします


## ダウンロードとインストールをしましょう {#w3dd197d}
Iron Pythonをインストールしましょう。まずはダウンロードです。[IronPythonの開発サイト](http://www.codeplex.com/IronPython)から[ダウンロードページ](http://www.codeplex.com/IronPython/Release/ProjectReleases.aspx?ReleaseId=2573)に進み、IronPython-1.1-Bin.zipをダウンロードします。
続いてインストールです。といってもただダウンロードしたzipファイルを解凍して、出てきたフォルダ「IronPython-1.1」ごとわかりやすい場所に置くだけです。
とりあえず、C:\にでも置きましょう。今後はC:\に置いたものとして（つまり、IronPythonのフォルダへのパスはC:\IronPython-1.1）説明します。

## パスを設定しましょう {#z9b192fc}
パスとはファイル、フォルダのアドレスのことです。
例えばマイドキュメントのパスはC:\Document And Settings\ユーザー名\My Documentです。
IronPythonのフォルダがWindowsのファイル検索対象に入るように、環境変数にIronPythonフォルダのパスを追加しましょう。

1. マイコンピュータを右クリックし、プロパティを開きます
1. 「詳細設定」タブの下のほうにあるボタン「環境変数」をクリックします
1. システム環境変数またはユーザー環境変数からPath（PATH、path）を選び、「編集」をクリックします
1. もともとあった変数値の最後にセミコロン（;）がなければセミコロンをつけ、C:\IronPython-1.1を追加します
1. 「OK」を押して設定を保存します

設定が終わったら、パスが通ったか確認しましょう。
スタートメニューの「プログラムを指定して実行」を起動します。

```
ipy
```

と入力して「OK」を押します。コマンドプロンプト（黒い画面のウィンドウ）が起動して

```
IronPython 1.1 (1.1) on .NET 2.0.50727.42
Copyright (c) Microsoft Corporation. All rights reserved.
>>>
```

と表示されていれば成功です！　コマンドプロンプトはそのまま閉じてしまってかまいません。

## アンインストールしたくなったら {#l300aea7}
フォルダごとゴミ箱に捨てて、設定したパスを削除しましょう。これでアンインストールは完了です。

# 操作に慣れましょう {#d818e470}
# すごさを体感しましょう {#l9900a29}
実際に動かしながら、IronPythonのすごさ、面白さを体感してみましょう。
題材は対話型シェルを使ったGUIアプリケーションの作成です。
入力するスクリプトは説明を読んでも意味がわからない部分が多いでしょうが、あまり気にせず、とりあえず書いてある通りに入力してください。

## 動画で見る {#e87c983f}
以下のチュートリアルとは少し違う内容の動画です。<br />
\#ref(ipygui.htm)<br />
ダウンロードするか直接実行してください（ただのフラッシュ視聴用のhtmlファイルです）。フラッシュ動画本体は<br />
\#ref(ipygui.swf)<br />
です。

## 準備 {#e7050483}
それでははじめましょう。コマンドプロンプトを起動して

```
ipy
```

と入力し、対話型シェルを起動します。
続いて、ちょっとしたおまじないをかけます。
何も考えずに

```
>>> import sys
>>> sys.path.append(r'C:\IronPython-1.1\Tutorial')
>>> import winforms
```

と入力してください。次はGUIアプリケーションを製作するためのおまじないです。

```
>>> import clr
>>> clr.AddReference('System.Windows.Forms')
>>> from System.Windows.Forms import *
```

と入力してください。

## ウィンドウの作成と操作 {#mc2f3ca3}
さあ、ここからが本番です！

```
>>> form = Form()
```

と入力してください。
FormはSystem.Windows.Forms.Formのことで、いわゆるGUIのウィンドウです。
上の一文でFormを作成したことになるのですが、Formは作成しただけは表示されません。表示してみましょう。

```
>>> form.Show()
```

と入力してください。Showの意味そのままに、ウィンドウが表示されます。
デスクトップに表示されなくてもタスクバーにはちゃんとありますので、タスクバー上のタイトルのないウィンドウをクリックしてください。
デスクトップに表示されます。
これだけでもしっかり最大化や最小化、サイズの変更などに対応していますが、さすがに味気ないですね。

ということで、とりあえずタイトルを追加してみましょう。

```
>>> form.Text = 'IronPython GUI Test'
```

と入力してください。ウィンドウのタイトルにIronPython GUI Testと表示されましたね。
タスクバーのウィンドウにも表示されていますので確認しましょう。

続いて、ウィンドウにボタンを設置してみましょう。

```
>>> button = Button()
>>> form.Controls.Add(button)
```

と入力してください。
ウィンドウの右上にボタンが設置されます。
ただ、やはり味気ないのでボタンの内側のテキストを設定しましょう。

```
>>> button.Text = 'Click Me!'
```

と入力してください。「Click Me!」ボタンになりす。

今のままではボタンを押してもなにも起きないので、ボタンをクリックしたときの動作を設定しましょう。

```
>>>def ButtonClick(sender, event):
...    MessageBox.Show('Hello IronPython World!')
...
```

と入力します。最後の行は改行のみの行です。続いて

```
>>> button.Click += ButtonClick
```

と入力します。ボタンをクリックしてみましょう。
Hello IronPython World!と書かれたメッセージボックスが出てきます。
## 統合開発環境 {#ieb50091}

- [IronPython tools for Visual Studio](http://www.ironpython.net/tools/)IronPython2.7で使える統合開発環境

## まとめ {#v34959d5}
どうでしたか？　準備はつまらないですが、ウィンドウを操作するのはなかなか楽しかったのではないでしょうか。こんなことが簡単にできちゃうのがIronPythonのすごいところです。

# 参考文献にあたりましょう {#sae75374}
## 参考サイト {#x002bd4d}

- まだあんまりない
- [【ハウツー】IronPython 2.0 - .NET普及への新たな”カンブリア爆発”となるか？ | エンタープライズ | マイコミジャーナル](http://journal.mycom.co.jp/articles/2007/07/03/IronPython2/menu.html)<br />
  プログラミングについての解説もあり<br />
- [IronPython で "Hello Silverlight 2 World!"](http://www.google.co.jp/url?sa=t&source=web&cd=2&ved=0CCQQFjAB&url=http%3A%2F%2Fdownload.microsoft.com%2Fdownload%2FD%2FD%2F3%2FDD3845E1-7475-45FE-982D-C1E08474C6B0%2F0204_Yagi_Nagoya.pdf&rct=j&q=ironpython%E3%80%80Silverlight&ei=Rg_KTY-fAYmiuQP11_nQBQ&usg=AFQjCNE_ud8VLm1th9UtpGP2nH0AeuHxgg&cad=rja)<br />
  PDF資料、IronPython2.0+Silverlight2<br />
- [IronPythonプログラミングの始め方 － ＠IT](http://www.atmarkit.co.jp/fdotnet/special/ironpython01/ironpython01_01.html)　[後編](http://www.atmarkit.co.jp/fdotnet/special/ironpython02/ironpython02_01.html)<br />
  IronPython1.1
- [C#とIronPythonで変化に強いWindowsアプリケーションを作る：CodeZine](http://codezine.jp/article/detail/2187)<br />
  IronPython1.1.1＋.NET Framework 2.0
- [C#からIronPython2.6を呼び出す方法](http://d.hatena.ne.jp/tomoemon/20091128/p1)<br />
- [日曜プログラマーの休日 ～ IronPython入門 ～](http://www.ops.dti.ne.jp/ironpython.beginner/LeaningPython.html)<br />
- [IronPython事始め](http://www.yasundial.org/ironpython/)<br />
  IronPython2.6入門
- [IronPythonを使ってみる](http://www.yasundial.org/ironpython2nd/index.html)<br />
  上記の続き

## 参考書籍 {#i9b0c25b}

- 解説書
  - IronPythonの世界（荒井省三、ソフトバンク）解説書であって入門書ではないので注意。Pythonまたはその他のプログラミング言語を知っていることが前提
