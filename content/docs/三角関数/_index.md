---
title: "三角関数"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "三角関数"
draft: false
---

[数学](/docs/数学) > 三角関数
# 三角関数 {#i6ecdda0}
これの別名を円函数と謂う。取り合えず定義からみるとよいでしょう。

<br />

# 三角関数 {#ua52bfb9}
## 定義 {#a84b9de2}
三角函数（円函数）には「正」と「餘（余）」があります。文字通り「正規の物」と「餘りの物」であることを表します。さて下図のような単位円（半径が1の円）を考えます。
このとき円を切断する割線を与え、それがx軸と成す角を「正角（θ）」、直角ベースで見れば残りの角たるy軸と成す角を「餘角（90°-θ）」と呼びます。

三角函数が江戸時代に蘭學と共に輸入された頃、「八線」と訳されました。全部で八つその線の長さを三角函数系で定義したからです。現在の高等教育ではこの内の三つを憶えるだけでよいのですから、楽な話ではないでしょうか。

「正角」にまつわる長さでは、正弦と正接をまづは憶えましょう。これは単位円の「接弦」と「接線」の長さです。
割線が単位円と交叉する点をPとすると、Pのy座標を「正弦」と呼びます。線を延ばすと丁度「接弦」になるから、正弦なのですね。接線は更に簡単で、OPを延長して(0,1)を通るx軸の法線とが交叉する点をQとしましょう。このQのy座標を「正接」と呼びます。三角形の三辺の比から正角をθ、Pの座標を(x,y)とすると、y=sinθ、tanθ=y/xとも定義できます。

「餘角」にまつわる長さでは、餘弦をまづは憶えましょう。これの考えかたは正角と同じです。
Pのx座標が「餘弦」と呼ばれますが、正角接弦と本質は同じ定義ですね。同様にx=cosθと定義されます。

ところで餘角をφとおくとθ+φ=90°で直角です。cosθ=sinφとできることは上述の定義から明らかであり、三角函数の相互補完公式として有名な「sinθ=cos(90°-θ)」が今ここで示せました。また入門編のここでは三角函数を90度以上に拡張することには触れません。敢て言及するならば、接弦や接線の長さには向きを考慮する正負が存在する、とだけ述べておきましょう。このことからも三角だけでは（内角は180度までだし）説明に苦しいので、これを円函数と呼ぶ方が適切っぽい気がしませんかねえ。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=sankaku.jpg" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=sankaku.jpg" /></div>


ちなみに、勘のいい人はお気づきでしょうが、餘接も存在します。この時の接線は(0,1)を接点とするのみで、大きな差はありません。彼をコタンジェント（cotθ）と謂います。それから八線の残りは「割（かつ）」「矢（し）」と呼ばれる物です。

正割は、序盤に「円を切断する割線」と書きましたが、この割線すなわちOPに関しての長さです。実際には割線と接線の交点Qへの原点からの長さOQ=secθ（セカント）として定義されます（OPは長さ1で一定なんで、こんな線の長さを定義する意味は無い）。餘割（コセカント；cosecθ）も同様です。

正矢（せいし）は、烏賊（ry栗の花（ry、「接弦」にかかる小さな「弓矢」を表します。Pからx軸へ垂ろした垂線の足をRとすると、点Rと点(1,0)の長さを正矢と謂います。餘矢も同様です。

かつて正割は三角函数の微積で使用してましたのでそれなりに有名です。正矢は一定の表記はないようですがverseθ（餘矢はcoverseθ）とします。1-cosθ=verseθであることは点R(cosθ,0)なので明らかですね。coverseθ=1-sinθも同様です。詳しくは八線表だとか、正割／餘割のページをググってみればいいですよ。下記ブログの三角形が解りやすい、かな。

http://blog.goo.ne.jp/shinya084/e/04616a1d8bc7e6d0ff3b7b9cf12fa66b

## グラフ {#l48a445d}
sin(サイン)とcos(コサイン)のグラフは以下の通りである。周期性が確認できる。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=graph.jpg" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=graph.jpg" /></div>


## sin（正弦関数） {#l0d7954b}
Sinは上の定義よりBC/ABです。覚え方はsの筆記体をなぞるようにします。θの位置に気をつけてください。この場合のSinθは{{< katex >}}\frac{1}{\sqrt{2}}{{< /katex >}}です。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=sin.png" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=sin.png" /></div>


## cos (余弦関数) {#af4fd2df}
Cosは上の定義よりAC/ABです。覚え方はCを描くようにします。この場合のCos30°は{{< katex >}}\frac{\sqrt{3}}{2}{{< /katex >}}です。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=cos.png" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=cos.png" /></div>


## tan (正接関数) {#fb3b0ec6}
tanは上の定義よりAC/BCです。覚え方はtを筆記体で書くようにします。この場合のtan60°は{{< katex >}}\sqrt{3}{{< /katex >}}です。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=tan.png" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=tan.png" /></div>


## 値 {#tbf803bd}
三角関数は以下のような値をとる

|<strong>角度</strong>|<strong>sin</strong>|<strong>cos</strong>|<strong>tan</strong>|
|---|---|---|---|
|<strong>0</strong>|0|1|0|
|<strong>30°</strong>|{{< katex >}}\frac{1}{2}{{< /katex >}}|{{< katex >}}\frac{\sqrt{3}}{2}{{< /katex >}}|{{< katex >}}\frac{1}{\sqrt{3}}{{< /katex >}}|
|<strong>45°</strong>|{{< katex >}}\frac{1}{\sqrt{2}}{{< /katex >}}|{{< katex >}}\frac{1}{\sqrt{2}}{{< /katex >}}|1|
|<strong>60°</strong>|{{< katex >}}\frac{\sqrt{3}}{2}{{< /katex >}}|{{< katex >}}\frac{1}{2}{{< /katex >}}|{{< katex >}}\sqrt{3}{{< /katex >}}|
|<strong>90°</strong>|1|0|定義されない|


## 定義に戻って考えてみる {#r1dce0b9}
この例では、{{< katex >}}sin{\frac{\pi}{4}}{{< /katex >}}、{{< katex >}}cos{\frac{\pi}{6}}{{< /katex >}}、{{< katex >}}tan \frac{\pi}{3}{{< /katex >}}の場合について考えました。
ここで導出された値はあくまで比です。三角関数は、あくまである辺と別の辺との比を表した関数であるといえるでしょう。
さて、定義によれば、三角関数は半径が1の単位円を考えた上で定義しましたので、例にとった三角形の斜辺を1と考えることもできます。
定義に掲載されている図を例にとって解説すると、{{< katex >}}sin \theta = \frac{y}{1}=y{{< /katex >}}がsinの値であると考えられますし、cosも同様に{{< katex >}}\frac{x}{1}=x{{< /katex >}}と考えられます。
このように単位円を考えておけば、sinは高さ、cosは幅に対応する関数として利用できるわけです。
これを利用すれば、ある平面に描かれた円の円周に沿って移動する点pを定義することも容易になります。
すなわち、このことをプログラムに応用すると、アナログ時計を描くようなことも簡単にできるのです。

## 参照 {#f6f7cb8d}
[三角関数:Wikipedia](http://ja.wikipedia.org/wiki/%E4%B8%89%E8%A7%92%E9%96%A2%E6%95%B0#.E4.B8.89.E8.A7.92.E9.96.A2.E6.95.B0.E3.81.AE.E5.BE.AE.E5.88.86.E6.B3.95)

# ラジアン（孤度法） {#lf1b3dd8}
## 定義 {#k3646014}
1ラジアン(radian)は半径と同じ長さ分の円周を持つ孤の角度です。単位はradで1rad≒57.29577951308232度です。下図の半径の赤い線と円周の赤い線の長さは同じです。この時のθが1radです。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=radian.jpg" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=radian.jpg" /></div>


## 便利な表現 {#e4054795}
360度はラジアンを使って表すと、2πradと簡潔に表せます。同様に180度はπrad、90度はπ/2radと表すことができます。


{{< katex display=true >}}rad = 2\pi \times \frac{angle}{360}{{< /katex >}}


## 参照 {#zb0cbdef}
[ラジアン:Wikipedia](http://ja.wikipedia.org/wiki/%E3%83%A9%E3%82%B8%E3%82%A2%E3%83%B3)


# 極座標 {#a3aa1d8b}
普通グラフになにか書くときは軸がX,Yで表されたもの（直交座標）で書いていたと思う。しかし極座標というものを用いて表したほうが簡潔に記述できる場合もある。

極座標とはθと半径rを用いて表す座標のことで、円運動などを表すのにとても便利だ。特にゲームなどでは使えるだろう。以下のように点Pはθとrによって与えられる。x=rCosθ,y=rSinθと直せる。


<div class="pukiwiki-ref"><img src="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=Polar_coordinates.png" alt="http://wiki.fdiary.net/vipprog/?c=plugin;plugin=attach_download;p=%BF%F4%B3%D8;file_name=Polar_coordinates.png" /></div>


# 三角函数応用編 {#u8b8563a}
## 三角函数の性質と相互関係 {#r54034da}
## 正弦定理 {#bf04a60a}
## 余弦定理（第一・第二余弦定理） {#od98b90d}
今の高校生はまるで習いませんが、第一余弦定理はとても便利な存在です。正弦定理の時と同様に三角形の辺と角度を定めると次の式を得ます。


{{< katex display=true >}}a=b cos C + c cos B{{< /katex >}}


{{< katex display=true >}}b=c cos A + a cos C{{< /katex >}}


{{< katex display=true >}}c=a cos B + b cos A{{< /katex >}}


規則性があって実に憶えやすい。これを第一余弦定理と謂います。憶えとくと便利な事も多いので、憶える事をお薦めします。これらの式を上手に変換してやると、第二余弦定理と呼ばれる式を得ます。これが現在の教育現場で余弦定理と呼ばれる存在です。


{{< katex display=true >}}a^2=b^2 + c^2 - 2bc cos A{{< /katex >}}


{{< katex display=true >}}b^2=c^2 + a^2 - 2ca cos B{{< /katex >}}


{{< katex display=true >}}c^2=a^2 + b^2 - 2ab cos C{{< /katex >}}


いづれも三つ憶える必要はなく、どれか一つづつ憶えれば後は臨機応変に利用します。普通憶えるのは一番目のやつですね。必ず三角形上での辺と角の位置関係を意識して憶えて下さい。その方が楽なので。

證明は、正弦定理から導けますし、幾何の問題としても導けます（第一／第二余弦定理の両方に種々の證明がある）。興味が在るならググれ。

## 正接定理 {#yea71ada}
高校では扱わない。数学者も知らない人は多分知らない、マイナーな公式。これはこれで面白いので一往それとして知られる式を示す。正弦定理の時と同様に三角形の辺と角度を定める。


{{< katex display=true >}}\frac{a-b}{a+b}= \frac{tan\frac{A-B}{2}}{tan\frac{A+B}{2}}{{< /katex >}}


下記ページ参考。
http://www.nn.iij4u.or.jp/~hsat/misc/math/tgthm.html

## 加法定理 {#d52bde27}
数Ⅱ三角函数の味噌。これを憶えれば後は自分で作れると言い張れる程強力。物理では後述の積和／和積と併せて必須の公式だ。


{{< katex display=true >}}sin(\alpha\pm\beta)=sin\alpha cos\beta \pm cos\beta sin\alpha{{< /katex >}}


{{< katex display=true >}}cos(\alpha\pm\beta)=cos\alpha cos\beta \mp sin\alpha cos\beta{{< /katex >}}


{{< katex display=true >}}tan(\alpha\pm\beta)=\frac{tan\alpha \pm tan\beta}{1 \mp tan\alpha tan\beta}{{< /katex >}}


この證明はいろんな方法があるけれど、幾何学的に示したページが斬新だったのでそれを示します。一往は正餘弦、正接のみ示した。正接は（滅多に使わないけれど）正弦餘弦との関係から導けるので自分で計算してみる事。正割にもあるらしいよ。

http://w3e.kanazawa-it.ac.jp/math/category/sankakukansuu/kahouteiri/henkan-tex.cgi?target=/math/category/sankakukansuu/kahouteiri/kahouteiri.html

## 倍角公式 {#wb67eb2e}
## 積和／和積の公式 {#q7d77bfc}
加法定理から導かれる公式なんだけど、古い文献には和積／積和公式の方が先にあつて、どうやら三角函数の和と積が変換できるという性質を重視した公式だったみたい。これがどれくらい強力かというと、二倍角／三倍角公式を使うより簡単に微分・積分できたりするんだな。それは微分のページをみてもらうとして、公式は次な感じだぜ。


{{< katex display=true >}}sin{\alpha} cos{\beta}=\frac{1}{2}\{sin(\alpha+\beta)+sin(\alpha-\beta)\}{{< /katex >}}


{{< katex display=true >}}cos{\alpha} sin{\beta}=\frac{1}{2}\{sin(\alpha+\beta)-sin(\alpha-\beta)\}{{< /katex >}}


{{< katex display=true >}}cos{\alpha} cos{\beta}=\frac{1}{2}\{cos(\alpha+\beta)+cos(\alpha-\beta)\}{{< /katex >}}


{{< katex display=true >}}sin{\alpha} sin{\beta}=-\frac{1}{2}\{cos(\alpha+\beta)-cos(\alpha-\beta)\}{{< /katex >}}


これを積和公式とか謂います（特に定つた名はない模様）。左辺ばかり見ずに右辺をみて頂きたい。加法定理を思いだせば何だか導けそうな気がしないかな。慣れてくるとスラスラ出てくるけど、慣れないうちは倍角公式と同じように加法定理を思いだして使う方が安全ですよ。


{{< katex display=true >}}\alpha=\frac{A+B}{2}, \beta=\frac{A-B}{2}{{< /katex >}}

と置くと、和積公式が得られます。


{{< katex display=true >}}sin{A}+sin{B}=2 sin{\frac{A+B}{2}} cos{\frac{A-B}{2}}{{< /katex >}}


{{< katex display=true >}}sin{A}-sin{B}=2 cos{\frac{A+B}{2}} sin{\frac{A-B}{2}}{{< /katex >}}


{{< katex display=true >}}cos{A}+cos{B}=2 cos{\frac{A+B}{2}} cos{\frac{A-B}{2}}{{< /katex >}}


{{< katex display=true >}}cos{A}-cos{B}=-2 sin{\frac{A+B}{2}} sin{\frac{A-B}{2}}{{< /katex >}}


ちなみにこれを幾何学の問題として證明することは可能だそうですよ。加法定理から導くより相当むつかしいのだけれど、先人の智慧の一端に触れてみるのもよい勉強となるでしょう。

ところでこれを憶えるための語呂合せが色々あって、「チン（sin）コ（cos）、コチン、ココ、マイ（minus）チンチン」という品のない語呂合せを私は知ってるので紹介する。これは積和での左側、和積での右側、つまり「積」部分の憶え方。それ以外の部分は規則性があるので「ココ（コサイン×コサイン）だから上から三番目！」、とか云う使い方をする。チンチンなら4、チンコなら1だね。「チンココチンココマイチンチン」。

## 三角函数の合成 {#r679e28b}
## 極限（附録） {#u9923e46}

{{< katex display=true >}}\lim_{\theta \to 0 } \frac{sin\theta}{\theta} = 1{{< /katex >}}


数Ⅲで登場する極限。高校レベルで多分これを除いて憶えるべきは、三角函数の導函数（及び原始函数）と一部物理で必要なテイラー級数展開した公式以外無いと思う。パッとみた所は不思議な公式なんだけど、正接の長さとか円周の長さとかから挾み撃ちして導けます。

フーリエを勉強すると、音楽であそべるぞ！楽しいから勉強してみよう
