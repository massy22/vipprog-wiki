---
title: "IDEなんていらない"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "IDEなんていらない"
draft: false
---

## .NET Framework 2.0 SDKの場合 {#nf08860a}
まだ.NET Framework 2.0をインストールしていない方は、SDKをインストールする前にインストールしておきます。
Windows Updateのカスタム更新で.NET Framework 2.0を追加するか、

- [.NET Framework 2.0](http://www.microsoft.com/downloads/details.aspx?familyid=0856EACB-4362-4B0D-8EDD-AAB15C5E04F5&displaylang=ja)
- [.NET Framework 2.0 日本語language pack](http://www.microsoft.com/downloads/details.aspx?familyid=39C8B63B-F64B-4B68-A774-B64ED0C32AE7&displaylang=ja)

からダウンロードできます。

上記2つをインストール済みなら、[Microsoftの.NET Frameworkのダウンロードページ](http://www.microsoft.com/japan/msdn/netframework/downloads/)から
.NET Framework 2.0 SDK 日本語版をダウンロードし、インストールします。


## .NET Framework 2.0 SDK {#fd849ff9}
### コンソールアプリケーション {#a5511c98}
コマンドプロンプトでの操作が基本となります。
[コマンドプロンプトを使ってみよう！](http://ykr414.com/dos/)などを参考に、
「cd」「dir」くらいは使えるようになっておいてください。
コンパイラのある場所（C:\WINDOWS\Microsoft.NET\Framework\v2.0.50727）にパスが通っていませんので、必要ならばパスを通してください。
「パスを通す」の意味がわからない方は、
「スタート」→「すべてのプログラム」→「Microsoft .NET Framework SDK v2.0」→「SDK コマンドプロンプト」で起動できる、SDK コマンドプロンプトを使用しましょう。
パスを通す必要がありません。

例えばexample.csというソースをコンパイルする場合、ソースのあるフォルダに移動して

```
csc example.cs
```

でコンパイルを実行します。
エラーがなければ、ソースコードのあるフォルダにexample.exeが生成されているはずです。ダブルクリックするか、

```
example
```

で実行できます。

### GUIアプリケーション {#da6fdd4f}
基本的にはコンソールアプリケーションと同じですが、コンパイラに引数として/target:winexeを渡します。
MyGUI.csをコンパイルしたい場合、

```
csc /target:winexe MyGUI.cs
```

となります。
