---
title: "RD"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "RD"
draft: false
---

[プログラミング言語/Ruby](/docs/プログラミング言語/Ruby)

# RD {#da63f547}
RDとはRuby Documentationの略です。

ソースコードに埋め込む形式としてはRDocのほうが主流になりがちですが、
RWiki<sup id="fnref-1" class="footnote-ref"><a href="#fn-1">*1</a></sup>や
VikiWiki<sup id="fnref-2" class="footnote-ref"><a href="#fn-2">*2</a></sup>、
BitChannel<sup id="fnref-3" class="footnote-ref"><a href="#fn-3">*3</a></sup>や
tDiary<sup id="fnref-4" class="footnote-ref"><a href="#fn-4">*4</a></sup>、
新リファレンスマニュアル<sup id="fnref-5" class="footnote-ref"><a href="#fn-5">*5</a></sup>など、
用いられているものはたくさんあります。


## 書く場所 {#y48d72c1}

```
=begin
 ...
=end
```


という複数行コメントがRubyにはありますが、PerlにおけるRODのような
感じでそこに埋め込むことを考えられていましたが、
前述の通りRDocにその役目は譲りつつありますし、
RDtoolは=beginや=end行を補完してくれたりします。


## 書式 {#k0dd1115}
基本的に、Inlineを除く書式は先頭の文字(HeadChar)で決まり、
要素の連なりはインデントによって判別されます。


<dl>
  <dt>TextBlock</dt>
  <dd>通常のテキスト段落。</dd>
</dl>

空白以外から始まる行の連なり。

```
Example:
こんにちは。
わたしは、
VIPからきますた。
```


<dl>
  <dt>Verdatim</dt>
  <dd>整形済みテキスト。</dd>
</dl>

インデントがそれまでより深い行の連続。
インデントが同じ行の連続がひとつのVerdatimとして扱われる。
Verdatim内ではInlineは解釈されない。

```
Example:
ここはインデント深くないのでTextBlock。
ここも。
  ここからVerdatim。
  改行などもそのまま反映される。
    ここもまだVerdatim。
    前より深いので。
  前より浅くなったが、まだまだVerdatim。
インデントが戻ったので、ここは普通のTextBlock。
```


<dl>
  <dt>Comment</dt>
  <dd>コメント。</dd>
</dl>

`#'で始まる行がコメント行とされる。
Rubyと使う文字が一緒だが、Rubyとは違って行の途中からの
コメントはない。


<dl>
  <dt>HeadLine</dt>
  <dd>見出し。</dd>
</dl>

六段階の見出しが書ける。
内容がLabelとなる(Labelについては後述)。

```
Example:
= HeadLine-1
== HeadLine-2
=== HeadLine-3
==== HeadLine-4
+ HeadLine-5
++ HeadLine-6
```


<dl>
  <dt>Include</dt>
  <dd>別ファイルの取り込み。</dd>
</dl>

RDを取り込む方法と、変換するのフォーマットを取り込む方法とがある。

```
Example:
#RDを取り込む
<<< anothoer_file.rd
#変換フォーマットに従って取り込む(HTMLならexternal_file.htmlを)
<<< external_file
```


<dl>
  <dt>ItemList</dt>
  <dd>箇条書き。</dd>
</dl>

`*'から始まる行は箇条書きの項目(Item)になり、
Itemの連続で箇条書きリストになります。

```
Example1:
* これが
* リスト
* です
```

ItemにはTextBlockから始まる各要素の連なりが置けます。
そのTextBlockの始まりがインデントの基準とされます。

```
Example2:
* つまり、Verdatimを書くには
    インデント基準より深くすればぉk
    なのでこれはVerdatim。
  ここからはTextBlock。
* 二つ目のItem。
  * 要素を入れ子に、ということは、
  * とうぜんリスト自体も含められるわけで。
*ただしHeadLineやIncludeは無理だよーん
```


<dl>
  <dt>EnumList</dt>
  <dd>番号付き箇条書き。</dd>
</dl>

`(1)'のようなHeadCharによって作られるItemの連なり。
ただ、番号自体は無視されます:-)

```
Example:
(1)ここはItemListと同じでTextBlock。
   |基準はここなので、
      これはVerdatim。
(2)ItemListと同じでよいのですが、`*'一文字のItemListのノリで
   入れ子を書こうとして、
 (3)全然入れ子になっていないというミスが多いので注意。
    ここは(1)、(2)とは違うEnumListにされます。
```


<dl>
  <dt>DescList</dt>
  <dd>定義や説明の記述。</dd>
</dl>

Term部とDescription部からなる。
Term部は`:'から始まる行で、Description部はTerm部を基準とした
インデント基準に沿った要素の連なり。
Term部の内容はLabelになる。
Term部にはTextBlockが置かれ、そのTextBlockの開始位置がインデント
基準となる。

```
Example:
:Term部
   Description部。ここがDescription部の基準を決める。
     その基準より深いのでこれはVerdatim。

:       深いTerm部
  「深」の前が基準なのでここはDescription部にされない
```


<dl>
  <dt>MethodList</dt>
  <dd>メソッド説明専用のDescList。</dd>
</dl>

DescListの要領だが、Term部は`---'から始まる。

```
Example:
--- HogeClass#piyo(arg1, arg2){...}
      何かをするメソッド。
      とにかく何かを返す。
```

Term部はRubyっぽくパースされてマークアップされる。
DescListと同様、Term部の内容がLabelになるが、
ちゃんとメソッド名のHogeClass#piyoだけが使われる。


<dl>
  <dt>Inline</dt>
  <dd>文中要素の総称。</dd>
</dl>

（（*強調*））のように「丸カッコ
<sup id="fnref-6" class="footnote-ref"><a href="#fn-6">*6</a></sup>
二つ+記号」からなる開き・閉じカッコ
によって、文中を装飾する要素です。


## Inline {#z207047e}
以下の各Inline表記で全角になっている記号は、Pukiwiki文法との
衝突を避けるためです。本来はもちろん半角です。


<dl>
  <dt>（（*強調*））</dt>
  <dd>内容を強調要素としてマークアップします。</dd>
</dl>


<dl>
  <dt>（（<リンク>））</dt>
  <dd>URLによるリンクやReferenceを指定します。</dd>
</dl>

ややこしいので別枠で説明。


<dl>
  <dt>（（-脚注-））</dt>
  <dd>内容を、その位置に対しての脚注として扱います。</dd>
</dl>


<dl>
  <dt>（（{コード}））</dt>
  <dd>内容をコード要素としてマークアップします。</dd>
</dl>


<dl>
  <dt>（（%キータイプ%））</dt>
  <dd>内容をキータイプ要素としてマークアップします。</dd>
</dl>


<dl>
  <dt>（（｜変数｜））</dt>
  <dd>内容を変数要素としてマークアップします。</dd>
</dl>


<dl>
  <dt>（（:インデックス要素:））</dt>
  <dd>内容をインデックス要素として扱います。</dd>
</dl>

例えばHTMLでは<a>タグのid属性とname属性が付加されます。


<dl>
  <dt>（（'Inlineのエスケープ'））</dt>
  <dd>この中にInlineを入れ子にしても、</dd>
</dl>

Inlineとしてパースせずそのまま表記する。

### Inlineリンク {#ke90ec37}
URLは

```
((<URL:http://www.google.co.jp>))
```

のように記述します。この「URL:」が大事です。

Referenceは、Labelの指定によるドキュメント内リンクです。

```
Example:
= HeadLine1

Inlineを使う。((<HeadLine1>))で先頭にリンク。
```

HeadLineやDescListで説明したように、Labelになりうる場所には
こうして簡単にリンクを晴れます。

この要素は<リンク>と表記されるが、

```
((<Text|リンク>))
```

とすることで、表記をTextにすることができます。

Text内で`|'や`/'をエスケープするにはタブルクォーテーションで
"Text"のようにしてください。


## 参考 {#ed5d99ae}

- [Rubyを256倍使うための本 魔道編](http://www.ascii.co.jp/books/books/detail/4-7561-3747-4.shtml)
- [The RWiki - RD working draft](http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=RD)



<div class="footnotes">
<hr />
<ol>
<li id="fn-1">dRubyを基幹にし、RDをWiki文法として使うWikiクローン <a href="#fnref-1" class="footnote-backref">&#8617;</a></li>
<li id="fn-2">RDLikeStyleというWiki文法が選択できる <a href="#fnref-2" class="footnote-backref">&#8617;</a></li>
<li id="fn-3">RDベースのWiki文法 <a href="#fnref-3" class="footnote-backref">&#8617;</a></li>
<li id="fn-4">Web日記システム。RDで日記を書くプラグインあり <a href="#fnref-4" class="footnote-backref">&#8617;</a></li>
<li id="fn-5">BitChannelベースに作られたシステム <a href="#fnref-5" class="footnote-backref">&#8617;</a></li>
<li id="fn-6">全角なのはPukiwiki対策。本来はもちろん半角 <a href="#fnref-6" class="footnote-backref">&#8617;</a></li>
</ol>
</div>
