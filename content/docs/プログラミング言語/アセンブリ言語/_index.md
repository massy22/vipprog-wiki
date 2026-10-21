---
title: "アセンブリ言語"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "アセンブリ言語"
draft: false
---

## アセンブリ言語 {#y2e7d5fc}
<br />

## はじめに {#h97e9c50}
あせんぶらぶら。現在、アセンブラを使わなければならないという状況はあまりない。<br />
だが、最適化のためとか、Revesingのためとかカーネル作る状況ではやっぱり必要なんじゃなぁ〜い？<br />
ということで、まとめておく。
コマンドプロンプトでdebugと入力するとアセンブリモードになってウマー
メモリも操れる。AX最強！

ただ、一言にアセンブリ言語といっても、CPU(MPU)によって違ったり、それこそ構文のまったく違う
アセンブラがいっぱいあるので、それぞれ別に解説ページをつくることにしよう。

基本的なことについてはCPUの成り立ちとかそういう感じのページをあとで誰かが作ってくれるよ！きっと。

## アセンブリ言語一覧 {#o16ecac9}
### NASM (Netwide Assembler) {#g0d985bf}

- x86向けのアセンブラ。16ビット,32ビットどっちも可能。
- ELFとかa.out形式だとかいろんなフォーマットで出力出きるので便利、生の機械語も出力できたりするので、OSとかの開発にも使える。
- Intel構文。ライセンスはいろいろあってLGPL


### [MASM](/docs/プログラミング言語/アセンブリ言語/masm) {#x993bca2}

- Microsoftがx86, Windowsのために作ったアセンブラ。
- フリーソフト
- Intel構文
- WindowsでReversingするなら必須。
- VC++でMASM：VC++2005EEなら - [Microsoft Macro Assembler 8.0 (MASM) パッケージ (x86 用)](http://www.microsoft.com/downloads/details.aspx?FamilyID=7A1C9DA0-0510-44A2-B042-7EF370530C64&displaylang=ja) を入手。VC++2008EEでは不要
- VC++以外なら [MASM32プロジェクト](http://www.movsd.com/) の [MASM32](http://www.masm32.com/) を入手。


### TASM {#h74ca6d4}

- Borlandが作っていたMASMと互換性の高いアセンブラ。x86向け


### gas (GNU Assembler) {#kccd4bf1}

- gccについてくる。x86向け
- GNU財団によるGNUによるGNUのためのアセンブラ。もちろんライセンスはGPL
- 一部では構文がキモいとされるが、あくまでも主観的な話し。gcc -Sでの出力記法がこれなので、読めると便利。
- AT&T構文


### BASE-60 {#o2a38d0b}

- Z80用アセンブラ
- =とかが使えるちょいっと変り種


### Flasm {#id51b6c4}

- 世にも珍しいFlash(Action Script)用のアセンブラ兼逆アセンブラ。ただしこれ単体では実行ファイルが出力できないので、リソースの入ったswfを用意する必要がある。
- 変数名がそのまま使われて、もれなくガベコレが付いてきたりする。
- 現在のところActionScript2まで対応、3.0は3.0の中間言語が埋め込まれた状態で逆アセンブリされる。
- Intel構文


### NESASM {#o0368de1}

- ファミコン(6502)向けのアセンブラ。正確には、世界的に有名なNESイメージ(ファミコンエミュレータ用ROM形式)に出力するのであって、6502アセンブラではないし、そのままファミコンカートリッジに入れても動かない。
- CPUだけでなくてPPUとかAPUとか弄れて楽しい。
- Intel構文


---

他にもCOMPASSとかA86とかAtari Assembler Editorとかいろいろあって困りますね＞＜

## 基本的なこと {#efe6e240}

## 参考リンク {#v4870e4f}

- コンピュータの基礎
  - ITpro &gt; selfup
    - [アセンブラで学ぶコンピュータ基礎のキソ：selfup](http://itpro.nikkeibp.co.jp/article/COLUMN/20070404/267378/?ST=techskill)
    - [コンピュータの仕組み---目次：selfup](http://itpro.nikkeibp.co.jp/article/COLUMN/20061220/257441/?ST=techskill)
    - [Part1　メモリー空間とは何か - コンピュータの基礎の基礎：selfup](http://itpro.nikkeibp.co.jp/article/lecture/20070824/280260/?ST=lecture)
    - [CPUの基礎の基礎：selfup](http://itpro.nikkeibp.co.jp/article/lecture/20070419/268988/)
    - [新人SEのための「プログラムが動く仕組み」---目次：selfup](http://itpro.nikkeibp.co.jp/article/COLUMN/20061208/256461/?ST=techskill)
    - [【5分で覚えるIT基礎の基礎】ゼロから学ぶ2進数---目次：selfup](http://itpro.nikkeibp.co.jp/article/COLUMN/20061213/256852/?ST=techskill)
    - [コンピュータにおける「データ表現」の基礎---目次：selfup](http://itpro.nikkeibp.co.jp/article/COLUMN/20061213/256817/?ST=techskill)
  - [コンピュータ・アーキテクチャ ［補足資料］（CPUの高速化手法）](http://laputa.cs.shinshu-u.ac.jp/~yizawa/CompArch/architecture/index.htm) -

信州大学工学部の講義資料。CPUの基本動作、（補足説明として）アセンブリ言語とマシン語

- [目指せプログラマー！ - x86系(8086系)アセンブラ入門](http://www5c.biglobe.ne.jp/~ecb/assembler/assembler00.html) - アセンブラ・アセンブリ言語を初めて学ぶ方から中級者向け
- [加速する日本人のアセンブラ離れ - スラッシュドット・ジャパン](http://slashdot.jp/developers/article.pl?sid=01/06/25/2032218) - 2001年当時の議論
- [Art of Assembly Language Programming and HLA by Randall Hyde](http://webster.cs.ucr.edu/AoA/Windows/index.html) - DownLoad：AoA.chm or AoA.pdf
- [C/C++/C#/Java/BasicプログラマのためのCASL II 入門講座](http://www.officedaytime.com/dcasl2/pguide/index.html) - 超初心者向け
- [東芝セミコンダクター社｜東芝半導体e-learning](http://www.semicon.toshiba.co.jp/design_support/elearning/elearning/index.html) - 超初心者向け
- [アセンブラでの高速化](http://hp.vector.co.jp/authors/VA003988/asm.htm) - アセンブラを極めたい人へ
- [Pentiumでの高速化](http://hp.vector.co.jp/authors/VA003988/asm1.htm) - アセンブラを極めたい人へ
- [AMD64での高速化](http://hp.vector.co.jp/authors/VA003988/asm2.htm) - アセンブラを極めたい人へ
- [ｷﾞｺ猫でもわかるファミコンプログラミング](http://gikofami.fc2web.com/) - NESASMというファミコンのエミュレータ用8ビットアセンブラについて解説しているサイト
