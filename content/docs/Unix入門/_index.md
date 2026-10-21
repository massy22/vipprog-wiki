---
title: "Unix入門"
date: 2026-07-26T10:15:29+09:00
lastmod: 2026-07-26T10:15:29+09:00
slug: "Unix入門"
draft: false
---

若干手抜き気味なので、皆さん修正してください。

# Unixとは {#b6a92da9}
## Unixって何？ {#af879ede}
最初のUNIXは、ベル研のトンプソンおよびリッチーによって開発されたOSです。以降、ここから直接ソースコードを受け継いだOSや、そうでないクローンまで様々なものが出現しました。現在では厳密にいうと、<strong>UNIX</strong>（<strong>大文字</strong>）とは標準化団体であるThe Open Groupに認証を受けたOSのことを指します。例えば<strong>Linux</strong>なんかはこの認証を受けてないので、UNIXではありません。ですが、<strong>POSIX</strong>(<strong>P</strong>ortable <strong>O</strong>perating <strong>S</strong>ystem <strong>I</strong>nterface)とよばれる標準規格が存在し、UNIXはもちろんのこと、Linuxに代表されるようにこの規格を満たすOSはほかにもたくさんあります。こういうOSを<strong>Unix-like</strong>なんて言ったりしますが、以下ここからは単にUnixと言ったらUnix-likeなOSを指すことにします。Linux以外にもUnixと呼ばれるOSとして代表的なのは、<em>BSD系</em>（FreeBSDなど）や<em>Solaris</em>などがありますが、おそらく最も普及しているのは<strong>Mac OS X</strong>（UNIXでもある）でしょう。

## Unixのどこがいいの？ {#je490b05}
何と言っても、ハッカーのためのOS。C言語はUNIXのために書かれた言語ですし、<em>Emacs</em>や<em>Vim</em>などハッカーの人気を博しているエディタもUnix出身。開発環境やライブラリのインストールも、Windowsに比べると楽勝です。そもそも、WindowsやMac OSの登場以前は、OSといえばUnixだったので、現在のコンピュータの様々な慣習はUnixの下で育まれてきました。現在でもWEBサーバのほとんどはUnixです。

そして、LinuxやFreeBSDに代表されるように、無料の環境が数多くあること。タダでOSから基本ソフトまで全部揃ってしまうとか、魅力的じゃありませんか？

## じゃあ、Unixのどこがダメなの？ {#dc57aef3}
まずは、ハードウェアの対応が若干貧弱な点。Linuxなんかだと大体のPCにインストールして普通に使えますが、たまにプロジェクタでうまく表示できなかったりとか、無線LANの感度が弱かったりとか、そのあたりはWindowsやMacに劣ってるのは否めません。

次に、ソフトウェアの問題。Unixには歴史もありますし、優秀なフリーウェアは多いですが、対応する商用ソフトは少ないです。例えばMicrosoft Officeは使えない（代用の<strong>LibreOffice</strong>〈OpenOffice.orgからの分家〉があるけど）。それから、PCゲームは大抵ダメ。人によっては、Windowsの優秀なフリーウェアが使えなくて困るケースもあるかも。<strong>Wine</strong>なるWindows用アプリケーションを動作させるソフトウェアはありますが、重いし、対応は完全ではないです。

そして、無料OSはサポートが商用OSほど充実しているわけではない点。当然ですね。また、残念ながらユーザはWindows/Macほど多くはないので、問題が起こっても人に聞けないという点はあります（でも、ググったり2chで聞いたりしたら意外とサックリ答えが返ってくるケースも多いですが）。

でも、そういう弱点を除けば、ほとんどWindowsやMacと同様の使い勝手です。実際筆者のメインマシンはUbuntuとWindowsのデュアルブートにしてるけど、Windowsは月に1回くらいしか起動する必要がないのだ。

## 敷居が高いんじゃない？ {#c9d52090}
たしかに以前はそういうイメージはありましたが、現在ではそんなことはありません。WindowsやMac OSと操作の面ではほとんど変わらないレベルに達していると思います。現に、夕張市なんかではコスト削減のためにLinuxの一種であるUbuntuを一般職員が使用している模様。導入法に関しては[Windowsユーザのための導入法](#windows)を参照。

# Linuxとは {#jdaef5c2}
## Linuxって何？ {#g1bfef07}
<strong>L</strong>inux <strong>I</strong>s <strong>N</strong>ot <strong>U</strong>NI<strong>X</strong>。Unix-Like OSの一種です。Linus Torvalsによって開発されたフリーのOS。しかし、基本ソフトは<strong>GNU</strong>(<strong>G</strong>NU is <strong>N</strong>ot <strong>U</strong>NIX)と呼ばれるプロジェクト等によって作成されているので、GNU/Linuxと呼ばれることも。現在Mac OS Xに次いで普及しているUnix。なお、WindowsやMacのようにOS自体に色々な機能が付属しているわけではなく、中核のカーネルと言われる部分しかLinuxは提供していません。例えばGUIの処理は<strong>X Window System</strong>というアプリケーションに丸投げしていたりするので、OSとしては商用のものよりはだいぶコンパクトです。

## Linuxディストリビューションって？ {#z91fe232}
通常Linuxを配布する際は、OSのLinuxだけではなく、先に挙げたX Window Systemなど様々なアプリケーションを付属しています。簡単に言えば、その組み合わせ。最近の一番人気は<strong>Ubuntu</strong>というディストリビューションで、初心者にも非常に導入しやすいです。他にも<em>Debian</em>、<em>CentOS</em>、<em>Fedora</em>あたりが有名どころ。国産のものでは<em>Vine Linux</em>なんてのもかつては流行していました。自由度の高い（=上級者向け）ディストリビューションとしては<em>Gentoo</em>とか。ドMの人はディストリビューションに頼らず、Linuxのカーネルのソースコードを取ってきて一からコンパイルする<em>Linux from Scratch</em>に挑戦してみよう。


## Ubuntuとは？ {#a4a2bb3f}
この記事でメインに扱っているディストリビューションは<strong>Ubuntu</strong>なので、一応解説しておきます。<strong>Ubuntu、それは人にやさしいLinux</strong>。語源はズールー語らしい。そのモットーに違わず、ほとんどのハードウェアについては、入れれば動きますし、OS自体やアプリケーションのインストールも極めて易しいです。

特徴としては、半年ごとのディストリビューションのアップデートが挙げられます。同梱しているアプリケーション、あるいは付属のパッケージマネージャからダウンロードできるアプリケーションがメジャーなバージョンアップ（セキュリティホール等バグの修正ではなく機能追加に重点を置くもの）した場合、そのバージョンは以降にリリースされるUbuntuから使えるようになります。

また、リリースの予定日を厳格に守ることでも知られています。これはズルズルと開発が引き伸ばされていつまで経っても新バージョンが出ないという事態を防ぐ反面、新バージョンリリース直後にはかなりバグが残っていたりします。

バージョン番号は「（リリース年）．（リリース月）」。リリースは4月と10月なので、下二桁は原則04または10です。各バージョン毎にアルファベット順に一文字選び、その文字から始まる形容詞と動物の名前を一語ずつ持ってきてコードネームにしています。現在の最新版<strong>11.10</strong>のコードネームは<strong>Oneiric Ocelot</strong>。次の12.04は<em>Precise Pangolin</em>。サポートは原則リリースから18ヶ月ですが、2年おき（直近では10.04）にリリースされるLTS版とよばれるバージョンでは、デスクトップ版でリリースから3年のサポートが提供されます。

# Macユーザのための導入法 {#bc7bbdbb}
喜ぶのだ、Mac OS XはUNIXです！やるべきことは、<strong>MacPorts</strong>や<strong>Fink</strong>などの[パッケージ管理システム](#pkg)を導入し、Unixの歴史溢れるフリーウェアをインストールすること、以上！

Linuxを使ってみたい人は[Windowsユーザのための導入法](#windows)を読んでね。

## MacPortsを使ってみよう {#i5548b0c}
まずは[パッケージ管理システム](#pkg)を読んでね。最近は<strong>MacPorts</strong>が優勢なので、こちらを題材に記載します。

まず重要なことを2点。MacPortsは各Linuxディストリビューションのパッケージ管理システムとは異なり、Apple公式のものではありません。なので、特にGUIにおいて、必ずしもMac OSとの相性が良いアプリケーションばかりとは限らない。

もう1点、MacPortsは原則アプリケーションをインストールする時にはソースからコードをビルドします。これは基本的に放っておくだけですが、GCCなんかインストールする日にはやたら時間かかるので注意。また、バグでビルドに失敗することも、頻繁にとは言わないまでも珍しくはないです。

MacPortsの特性として、各パッケージに多くの<em>Variant</em>があることが挙げられます。例えば、ImageMagickはデフォルトではrsvg形式は扱えません。多くのパッケージ管理システムではこのような場合、別途パッケージを用意してそれをインストールさせるという形ですが、MacPortsではImageMagickのrsvgというVariantをオンにすることでrsvgに対応したImageMagickがインストールできます。

また、過去にインストールされた異なるVariantや、過去のバージョンのパッケージは<em>inactive</em>（無効）になっており、これは明示的にアンインストールしない限り、再度コンパイルをすることなく<em>active</em>（有効）にすることができます。

まずはここからダウンロードしてみよう！
http://www.macports.org/

基本的に操作はターミナルで行います。詳しい操作方法はググッて下さい。基本だけいくつか。

- <strong>Port</strong>（パッケージのリスト）のアップデート：


```
sudo port selfupdate
```

- Portのリスト（長いのでlessとかページャ使って見ること）：


```
port list
```

- インストールされたPortのリスト（同上、activeなものには(active)と表示）


```
port installed
```

- Variantの確認（例：ImageMagick）


```
port variants ImageMagick
```

- パッケージのインストール（例：rsvgとmpegをオンにしたImageMagick）


```
sudo port install ImageMagick+rsvg+mpeg
```

- パッケージのアップグレード（例：ImageMagick）


```
sudo port upgrade ImageMagick
```

- 新バージョンがあるパッケージを全てアップグレード


```
sudo port upgrade outdated
```

- パッケージの無効化（例：ImageMagick）


```
sudo port deactivate ImageMagick
```

- パッケージの有効化（例：rsvgをオンにしたImageMagickの6.6.9-1_1）


```
sudo port activate ImageMagick@6.6.9-1_1+rsvg
```

- パッケージのアンインストール（例：ImageMagick）


```
sudo port uninstall ImageMagick
```

- 無効なパッケージを全てアンインストール


```
sudo port uninstall inactive
```

- パッケージがビルド中におかしくなったときにやり直し（例：ImageMagick）


```
sudo port clean ImageMagick
```


ターミナルでいちいちVariant確認して入れるのが面倒な人には、細かいところの出来は今ひとつですが<em>Porticus</em>というGUIラッパもあります。
http://porticus.alittledrop.com/

### GUIがしょぼいんだけど {#df0c2175}
GIMPとかInkscapeなんかをMacPortsを使ってインストールする人も多いと思います。が、いかんせんGUIが普通のアプリケーションと統一的でなくてしょぼい。理由はといえば、GUIアプリケーションの多くは例えば<strong>GTK+</strong>のようなツールキットを使っていて、これがCocoaを直接叩かずにX11を通して出力しているからです（Unixでは全てのGUIアプリケーションがXを使っているので、出力も綺麗だし問題にならない）。

これは現在のところどうにも解決策がないです。Unix系のGUIアプリケーションを綺麗に使いたければ、別途Linuxか何かをインストールするしかないです。なお、GTK+にはquartzというVariantsがあって、これを使うとMacの描画システムを直接叩けるのですが、GTK+に依存しているパッケージの中にはquartzに対応していないものもかなり多く、そういうものをインストールしようとするとビルドがこけるので、あまりquartzオプションをつけたGTK+のインストールはおすすめしません。

## G5 ？　なにそれおいしいの？ {#q287aeee}
PPC だけど クロックが 300Mhz ぐらい（G3 とか）の貴方！　そんなにないよ 100Mhz だよ（第二世代）という貴方！　残念ながら Mac OS X は（魔改造しないと）インストールできませんよ。

でも・・・・いまどき G3 の初期ロットなんぞをメインで使ってる人はいないと思います。我が機を愛して已まぬという趣味の人はいろいろ調べてみてくれ。

## PPC ？　なにそれおいしいの？ {#ie4eb7f4}
68k をメインで（略。Intel はお呼びでないからお帰り。

68k で UNIX 動かそうとする猛者はいないんじゃないだろうか・・・・。
（ごくわずかにいるけど明らかにここでやる範囲を超えている。Unix板かMac板とかで聞いてきてください。）

# Windowsユーザのための導入法 {#windows}

## Ubuntuのisoをダウンロード {#oe03d976}
現在Unixの中で一番ユーザフレンドリーなのは<strong>Ubuntu</strong>だと思います。なので、まずはここからダウンロードしてみよう！

http://www.ubuntulinux.jp/News/ubuntu1110-desktop-ja-remix

## VirtualBoxにインストール {#e24f4a9c}
PCのパフォーマンスが十分で、かつあんまり構成をいじりたくない場合にはこれで試してみるのがいいかも。

<strong>VirtualBox</strong>とは仮想マシンです。VirtualBoxの中から先のisoを選択して起動すると、Ubuntuが使えます。

VirtualBoxのダウンロードはこちらから。

http://www.virtualbox.org/

## Live CDから直接起動 {#xb660636}
先のisoをCDに焼いてみよう。そうするとLive CDの完成です。これをドライブに入れて起動、「インストール」ではなく「Ubuntuを起動」を選べば、Ubuntuを試してみることはできます。が、データの保存をできないのがちょっと不便。

## Live USBメモリを作る {#j68468de}
さすがにデータの保存ができないのは不便なので、たまにしか使わない人はUSBメモリにUbuntuを全部入れてみるのもいいかも。ここを参照。

https://wiki.ubuntulinux.jp/UbuntuTips/UsbInstall/CreateUSBStartupDisk

## Wubiで実際にインストール {#ef901a55}
本格的に使いたいから実際にHDDにインストールしてみたい、でもパーティション切るとか怖いって人には<strong>Wubi</strong>(<strong>W</strong>indows-based <strong>Ub</strong>untu <strong>I</strong>nstaller)。

http://wubi.sourceforge.net/

ここから<strong>Wubi</strong>をダウンロードして、Windows上から実行するだけ。アンインストールも「アプリケーションの追加と削除」からできるのでお手軽です。

なお、Mac用にMubiの開発も進められているという話は聞きますが、現状どうなっているかは不明。

## 本格的にデュアルブートしたい {#k072dbea}
そんなあなたは、Live CDから直接インストールしよう！

Windowsなら基本、言われたとおりにしていれば勝手にデュアルブート環境ができます。Macだとそういうわけにはいかないようですが。

バージョンは古いですが、基本的な手順はほとんど変わらないのでこちらを参考に。https://wiki.ubuntulinux.jp/UbuntuTips/Install/InstallDualBoot

## UnixのアプリケーションだけWindowsから使いたいんだけど {#s24f99b4}
そういう用途なら、OSを新たに入れるのではなく、<strong>Cygwin</strong>というプロジェクトがあります。

http://www.cygwin.com/

ここのページの"Install or update Cygwin now!"からCygwinをダウンロード。そうするとWindowsからUnixのアプリケーションを使えますが、やや重いし、いくらか小回りが効かない印象はあります。

# アプリケーションはどうやってインストールするの？ {#nf142c97}
## パッケージ管理システム {#pkg}
UbuntuなどのいわゆるDebian系と呼ばれるディストリビューションにはapt、CentOSなどのRed Hat系にはyumという、<strong>パッケージ管理システム</strong>とよばれるソフトウェアがインストールされています。例えばUbuntuでrubyをインストールしたい場合、<strong>Synapticパッケージ・マネージャ</strong>もしくは<strong>Ubuntuソフトウェアセンター</strong>を立ち上げて、rubyを検索、チェックを入れるだけでインストールできます。メジャーどころのフリーウェアは、大体ここを調べるだけで簡単にインストールできます。Cygwinのsetup.exeも同様です。

マイナーなソフトウェア、あるいはプリンタドライバなど、パッケージマネージャで見つからないものをインストールしたい場合、配布サイトでDebian系なら<strong>.deb</strong>ファイル／Red Hat系なら<strong>.rpm</strong>ファイルが手に入るなら、それをダウンロードしましょう。ダブルクリックするだけでインストールできるはずです。.tar.gzとか.tar.bz2とかしか見つからなければ[野良ビルド](#unofficial)を参照。

こうやってインストールしたソフトウェアをアンインストールするときも、パッケージ管理システムからできます。簡単ですね。

各パッケージには<strong>依存関係</strong>が設定されています。例えば、ImageMagickはjpegファイルなんかを扱いますが、それは完全にlibjpegに任せてるので、ImageMagickは普通libjpegなどのインストールが済んでいないとインストールできません。パッケージ管理システムはこの依存関係に従って、例えばImageMagickをインストールしたいと思ったら勝手にlibjpegなどをダウンロードしてインストールしてくれます。ただし、ImageMagickをアンインストールしようと思っても、普通はlibjpegは勝手にはアンインストールされないので注意。

なお、今紹介したような環境では、基本的にアプリケーションはコンパイル済みのバイナリをダウンロードすることになります。一方、BSD系のUnix（FreeBSDなど）では<strong>Ports</strong>、Mac OS Xでは<strong>MacPorts</strong>もしくは<strong>Fink</strong>というパッケージ管理システムを使うことになりますが、こちらは必要に応じてソースを勝手にダウンロード、コンパイルしてくれるというシステムです。従って、多少の時間はかかりますし、.debや.rpmのようなファイルもありません。

あと、パッケージ管理システムに入ってくるソフトウェアは必ずしも最新版とは限らないので、新しいもの好きの野郎どもは競って野良ビルドだ！

## 野良ビルド {#unofficial}
アプリケーションの配布形式が.tar.gzとか.tar.bz2とかしか見つからなかったときは、<strong>野良ビルド</strong>とよばれる最終手段を取ることになります。要するに、そのファイルはソースコードが詰まった圧縮ファイルなので、自分でコンパイルしろってことです。

まずは適当なフォルダに圧縮ファイルを移して、解凍しましょう。.tar.gzならターミナルから

```
tar xzf hoge.tar.gz
```

.tar.bz2なら

```
tar xjf hoge.tar.bz2
```

を実行します。

次に、できたフォルダの中に入ります。READMEなどがあればちゃんと読むこと。多くの場合は、中にconfigureというファイルがあります。これが、インストールの前段階の設定
を行うスクリプトです。

```
./configure
```

を実行すると、画面に色々出ます。エラーとかが出て止まった場合は、指示に従いましょう。多くの場合は依存しているライブラリをインストールしてないせいです。そういうわけで、入れろと怒られたライブラリがパッケージ管理システムにあればインストールすればいいし（大抵後ろに-devがつくライブラリが必要です）、なければソースを探してきてドミノ式に野良ビルドすることになります。

無事に./configureが成功したら、次はコンパイルです。普通は

```
make
```

とだけ打てば良いです。というか、./configureが失敗してたら、これを打ったときに怒られます。大きいアプリケーションならここでかなり時間がかかります。

コンパイルも無事に成功したら、できた実行ファイルを然るべき場所（普通は/usr/local/binなど）にコピーします。これは管理者権限が必要なので、

```
sudo make install
```

と打ちましょう。管理者権限がない人は、./configureに--prefixなど適当なオプションを与えてインストール場所を変更することになりますが、それに関しては割愛。

以上がつつがなく終わればインストール成功です。

ちなみに、アンインストールしたいときは、解凍したフォルダに戻って

```
sudo make uninstall
```

と打ってみましょう。良心的なプログラムなら、これでアンインストールできるはずです。もしこれでできなかったら……インストールの際にコピーしたファイルを自力で探して削除するしかないですねえ。こういう事態を防ぐために<em>checkinstall</em>といったアプリケーションもありますが、ここでは割愛します。

# リンク {#wd8cabae}

- [http://www12.atwiki.jp/linux2ch/ 2ch-Linux-Beginners ]
- [http://penguin.tantin.jp/mori/FrontPage.html ペンギンの杜 〜 Linux ソフト集 〜 ]
