---
title: "エディタ"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "エディタ"
draft: false
---

## 大体 {#xce76af6}
たいていのエディタは　文字列の置換操作、矩形選択、キーボードマクロ、ファイル検索、対応括弧検索、キーワードの色分けなんかが使えるようになっています。それぞれのエディタで正規表現の仕様に違いがあったり、テキストに対する編集操作の順番を記述したマクロファイルのいじりやすさ等で、いろいろ使い勝手の良し悪しが出てきます。例えばあるソフトウェアでは対応括弧を太字にして強調するだけでその位置まで飛んでくれなかったり・・・　ではどうぞ
## vi系 {#xce76af6}
おそらく最古参のスクリーンエディタのひとつ。

設定は独自の書式。VimはVimスクリプトと呼ばれる独自の言語に
よる拡張も可能。


<dl>
  <dt>vi</dt>
  <dd>ESCまたはctrl+[を押すことで、</dd>
</dl>

文字を入力するモードとカーソルの移動やらコマンドの実行やら保存やら読み込みやらをやるモードとを切り替える操作が特徴的


<dl>
  <dt><a href="/wiki/docs/エディタ/vim">vim</a></dt>
  <dd>上の新しいバージョンだと思っておけばおｋ（違うけど）</dd>
</dl>

:|名前の由来はVi-IMitated(viの模倣) -> Vi-IMproved(viの改良)。<br />
シェル上で<br />
$ <em>vimtutor</em><br />
とするとチュートリアルが表示される。

## emacs系 {#q566dfa2}
Lisp言語の処理系が組み込まれているのが特徴
(このLispはEmacs用に訛ったEmacs Lisp、elispなどと呼ばれる方言の
ことが多い)。

エディタのイベントをフックして関数に対応させることで柔軟すぎる機能
拡張を可能に。

そのLispによってメーラやブラウザまで完備されて、一度立ち上げたら
二度とEmacsから出ない、いわゆる「Emacsとは環境だ」と言い切るユーザもいる。

…反面、フォントや字間などのエディタとして基本的な設定もLispで書く
必要があるため、馴れ初めが大変。


<dl>
  <dt>emacs</dt>
  <dd></dd>
</dl>

:|ものすごいいろいろできる、起動がエディタとしてはかなり遅い
:|いろいろできすぎてかえって設定が面倒で分かりにくいという説もある


<dl>
  <dt><a href="http://www.meadowy.org/meadow/">meadow</a></dt>
  <dd>emacsのwindow版＋α</dd>
</dl>


<dl>
  <dt><a href="http://www.jsdlab.co.jp/~kamei/">xyzzy</a></dt>
  <dd>emacsのwindows版といえるものの独自性強め。</dd>
</dl>

:|搭載されているLispはelispではなくCommon Lispのサブセット
(xyzzy lispなどと)。
:|サポートが2chの当該パートスレやWikiで有志によってなされている
のも特徴的。
:|拡張LispについてはNet Installerというユーティリティもあったりする。


## その他 {#y7c69eaa}
### Windows {#vdcde87c}

<dl>
  <dt><a href="/wiki/docs/エディタ/notepad">メモ帳（notepad）</a></dt>
  <dd>Windowsに標準搭載</dd>
</dl>


<dl>
  <dt><a href="http://notepad-plus-plus.org/">notepad++</a>(<a href="http://www.geocities.jp/npp_euc_jp/">日本語対応版</a>)</dt>
  <dd>名前と裏腹にすごい</dd>
</dl>


<dl>
  <dt><a href="http://www5f.biglobe.ne.jp/~t-susumu/index.html">TeraPad</a></dt>
  <dd>やたらありがたられてるけど機能的には不満</dd>
</dl>

:|JWord騒動で株を落としたが、手軽でかつある程度高機能ではある。


<dl>
  <dt><a href="http://sakura-editor.sourceforge.net/">サクラエディタ</a>　<span style="color:red;">初心者におすすめ！</span></dt>
  <dd></dd>
</dl>

:|Windows用オープンソースなテキストエディタ。
:|標準での動的単語補完やアウトライン解析、外部コマンドの実行などが可能。
正規表現よる検索や置換はもちろん、豊富な整形処理や短形選択、diffや
grepもできる。
:|拡張はVBScriptやJScriptに対応。
:|Unicode版のサクラエディタWもある。


<dl>
  <dt><a href="http://hide.maruo.co.jp/">秀丸</a></dt>
  <dd>Windows用高機能エディタ。シェアウェア。</dd>
</dl>

:|常駐することで軽快な動作を実現する。
:|拡張はC言語系統文法の高機能独自マクロや、正規表現によるシンタックスハイライト定義など柔軟。
:|歴史はわりとあり、資産も豊富。
:|コードブロックの折りたたみやアウトライン機能、タグジャンプや外部コマンドの実行も備える。
:|自前のGrepの搭載やタブ/SDIの混在、縦書き表示も可能。
:|Ver.7から標準で単語補完にも対応した模様。
:|個人的にはパイプ入力をきちんと取り込んでくれるところが好み。
:|シェアウェアだが、アカデミックな人やフリーソフト作者にはフリーのライセンスが用意されている。詳しくは公式を。


<dl>
  <dt><a href="http://jp.emurasoft.com/">EmEditor</a>　<span style="color:red;">初心者におすすめ！</span></dt>
  <dd></dd>
</dl>

:| Windows用高機能エディタ。


<dl>
  <dt><a href="http://www.yokkasoft.net/">NoEditor</a></dt>
  <dd>Windows用高機能エディタ。</dd>
</dl>


<dl>
  <dt><a href="http://www.anchorsystems.jp/anchor/ashp/peggy/pegindex.html">PeggyPad</a></dt>
  <dd>Windows用エディタ。コードブロックごとに背景に違う色が付くので見やすい</dd>
</dl>


<dl>
  <dt><a href="http://mfactory.me/">gPad</a></dt>
  <dd></dd>
</dl>

Windows用エディタ。多機能、日本語対応。


<dl>
  <dt><a href="http://www.sublimetext.com/">Sublime Text</a></dt>
  <dd></dd>
</dl>

:|Windows, Mac, Linux用エディタ。多機能、日本語対応。
:|プラグインで拡張出来る。無制限無期限の試用が可能
:|モダンなUIが目立つ。ただShift-JIS（文字エンコード）の読み込みに対応してないので注意。（プラグインで回避可能）


<dl>
  <dt><a href="http://www.hi-ho.ne.jp/a_ogawa/">OEdit</a>　<span style="color:red;">初心者におすすめ！</span></dt>
  <dd>Windows用エディタ。</dd>
</dl>

:|メモ帳のように軽快な動作が特徴。
:|Windows向けだが、UTF-8やEUCにも対応しており、日本語が普通に使える。
:|正規表現も使える。
:|Schemeをマクロ言語として採用しており、Emacsのように柔軟なカスタマイズができる。


---


- テキストエディタでの開発をちょっとだけ便利に - [各種テキストエディタで HTML HELP(*.chm) をキーワード検索](/docs/検索テクニック#nbd8b357)


### Unix系 {#lfa168ab}

<dl>
  <dt><a href="http://www.gnome.org/projects/gedit/">gedit</a></dt>
  <dd>Gnomeのメモ帳</dd>
</dl>

:|Gnomeなディストリにはたいてい標準でついている。
:|多くの言語の強調表示やカラーテーマを使って配色を変えること
:|が可能で、Pythonなどで作られたプラグインも多数
:|意外と使える。タブ管理もできる。
:|文字コードが微妙に対応できてないところがあって困る。


<dl>
  <dt><a href="http://www.kate-editor.org/">KWrite</a>(Kate)</dt>
  <dd>KDEのメモ帳。</dd>
</dl>

:|KDEに標準でついてる。
:|多くの言語の強調表示やカラーテーマを使って配色を変えること
:|が可能で、折りたたみ機能なども
:|タブ機能がないのが残念。
:|geditに比べ文字コード判定はしっかりしてる。


<dl>
  <dt><a href="http://tarot.freeshell.org/leafpad/">leafpad</a></dt>
  <dd>GTK+2を利用するメモ帳みたいにシンプルなエディタ</dd>
</dl>

:|geditに比べ機能が劣る。


<dl>
  <dt>nano</dt>
  <dd>GNUが作ったGNUによるGNUのためのスクリーンエディッタ(GNU nano)。</dd>
</dl>

:|vimやemacsはキーバインドが大変で学歴が足りませんといった
:|「学歴くん」にもオヌヌメなエディッタ。軽いし最近のディストリには
:|結構最初からついてくる。
:|ただしvimやemacsのような高機能は期待できない。
:|pineというemailクライアントのオマケについてたpicoっていうエディタのクローンらしい。
:|コンソール用のエディタのなかでは「直感的」なほうなのでは？


<dl>
  <dt>ed</dt>
  <dd>古き良き時代のエディタ</dd>
</dl>

:|その昔、コンピュータができたばかりの頃のお話。当時はディスプレイではなく、
:|一行ずつ印刷されるプリンタに文字を出力していました。
:|当然、編集したいファイルを画面に表示して直接書き換えるなんて事はできないので
:|行単位で編集するラインエディタ、edが使われていました。
:|高度な機能はなく、せいぜい正規表現が使える程度です。でもcatよりは
:|ずっと快適。
:|一昔前はviと並んでUnix管理者の基礎知識でしたが、最近では使える人は
:|ごく僅かです。


<dl>
  <dt>cat</dt>
  <dd>catコマンドのこと</dd>
</dl>

:|`cat > main.c`　のようにして使う
:|-vimすら起動させるのが面倒だ。
:|-viですら重い
:|といった猛者向けエディッタ。
:|ただし、一行単位でしか修正できないし、確定した行は編集出来なので注意が必要。
:|実際スレには使ってる奴も結構いるは…ず…？


### MacOS X {#bd623ddf}

<dl>
  <dt>TextEdit</dt>
  <dd>最初からインスコされるそれなりに高性能エディタ</dd>
</dl>

:|更に「/Developer/Examples/AppKit/TextEdit」にあるのでCocoa 勉強用アプリでもある。
:|AppKit の NSTextView = TextEdit の図式が成立つ。
:|OS X がうぷでーとすると何かしら機能が増える。


<dl>
  <dt>Xcode</dt>
  <dd>たぶん初めからついてる開発環境兼エディッタ。</dd>
</dl>

:|ただのエディッタとして使ってる人もおおいはず


<dl>
  <dt>Coda</dt>
  <dd>某所で話題だった。</dd>
</dl>

:|30日無料であとは有料です。
:|Xcodeでは細かく対応しきれない PHP とかはこういう他の奴ですることもあるかも。


<dl>
  <dt>mi</dt>
  <dd>通称：ミミカキ</dd>
</dl>

:|軽さもあるが、ハイライトなどもついており、ちょっとした書き物用に使える。
