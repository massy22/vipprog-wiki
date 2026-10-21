---
title: "Objective-C"
date: 2023-11-12T02:31:09+09:00
lastmod: 2023-11-12T02:31:09+09:00
slug: "Objective-C"
draft: false
---

# Objective-C {#m05c3047}
完全なC互換。CocoaはObjective-CのAPI。<br />
Cocoaについて学べば必然的にObjective-Cについて学べます。<br />
主な開発環境はXcode(または旧Project Builder)。


一般的な Object 指向の思想を理解している前提の元に文法事項を解説。全てをつぶさに読む必要はなく、必要な時に必要な所を参照した方がよい。

## 予め定義された型と変数 {#predefined}
Objective-C では新たに次の様な型が定義されている（objc-class.h）。

- id（任意のレシーバを表す型）
- SEL
- IMP
- Method
- Class
- BOOL


言語構造上の変数は 

- nil
- self
- super
- YES
- NO


など。

## クラス（class） {#class}
定義は.hファイル、実装は.mファイルに書く。Xcode だと自然に追加される。

> <span style="color:#007900;">//	 MyObject.h</span><br />
<strong><span style="color:#CB0094;">@interface</span> MyObject : NSObject{</strong><br />
<strong>}</strong><br />
<strong><span style="color:#CB0094;">@end</span></strong><br />

> <span style="color:#007900;">//	MyObject.m</span><br />
<strong><span style="color:#CB0094;">@implementation</span> MyObject</strong><br />
<strong><span style="color:#CB0094;">@end</span></strong>

Objective-C では C との区別のため、拡張した文法は@を付け記述する（ディレクティブ参照）。今この記述で、NSObject を継承した MyObject クラスの定義をした事になる。<br />
新たなクラスを定義する場合は一般に NSObject を継承して定義する。

### 命名規約（クラス） {#classname}
クラスは大文字で始める。自身のクラスに接頭辞を付ける際、
NS（NeXTSTEP）や IO（Input-Output）や OS（Operating System） や CG（Core Graphics）はAppleによって既に使われていて紛らわしいので避けよう。

## メッセージ（message）/メソッド（method） {#method}
先程のクラスに、インスタンス変数 obj、クラスメソッド myClassMethod、メソッド myMethod を追加すると、

> <span style="color:#007900;">// MyObject.h</span><br />
<span style="color:#CB0094;">@interface</span> MyObject : NSObject{<br />
&nbsp;&nbsp;&nbsp;<strong><span style="color:#CB0094;">id</span> obj;</strong><br />
}<br />
<strong>+(<span style="color:#CB0094;">void</span>)myClassMethod;</strong><br />
<strong>-(<span style="color:#CB0094;">id</span>)myMethod;</strong><br />
<span style="color:#CB0094;">@end</span><br />

> <span style="color:#007900;">// MyObject.m</span><br />
<span style="color:#CB0094;">@implementation</span> MyObject<br />
<strong>+(<span style="color:#CB0094;">void</span>)myClassMethod</strong><br />
<strong>{</strong><br />
&nbsp;&nbsp;&nbsp;<span style="color:#007900;">/// your code</span><br />
<strong>}</strong><br />
<strong>-(<span style="color:#CB0094;">id</span>)myMethod</strong><br />
<strong>{</strong><br />
&nbsp;&nbsp;&nbsp;<strong><span style="color:#CB0094;">return</span> obj;</strong><br />
<strong>}</strong><br />
<span style="color:#CB0094;">@end</span>

ヘッダにおける括弧の使い方に注目。括弧内はインスタンス変数を記述するものであり、メソッドは別で定義する。
クラスメソッドは+、インスタンスメソッドは-で書き始める規則がある。<br />
メソッドは、<span style="color:#CB0094;">@interface</span> ~ <span style="color:#CB0094;">@end</span> と <span style="color:#CB0094;">@implementation</span> ~ <span style="color:#CB0094;">@end</span> において記述する。

MyObject のインスタンスを保持した変数 receiver が存在したとして、二つのメソッドを呼び出すには、

> [<span style="color:#277075;">MyObject</span> <span style="color:#13484C;">myClassMethod</span>];<br />
[receiver <span style="color:#13484C;">myMethod</span>];

と書く。Objective-C においてはインスタンスをレシーバと呼ぶ。
「レシーバにメッセージを送る」と言えば、インスタンスメソッドを起動する事を意味する。


### 引数 {#args}
id 型の変数 value を -myMethod に渡す場合、

> [receiver <span style="color:#13484C;">myMethod</span>:value];

と書く。メソッド名の後に :（コロン）を打って引数を書くと、レシーバにメッセージが送信される。上の定義と実装を書き直せば、

> <span style="color:#007900;">// MyObject.h</span><br />
<span style="color:#CB0094;">@interface</span> MyObject : NSObject{<br />
&nbsp;&nbsp;&nbsp;<span style="color:#CB0094;">id</span> obj;<br />
}<br />
&#43;(<span style="color:#CB0094;">void</span>)myClassMethod;<br />
&#45;(<span style="color:#CB0094;">id</span>)myMethod<strong>:(<span style="color:#CB0094;">id</span>)val;</strong><br />
<span style="color:#CB0094;">@end</span><br />

> <span style="color:#007900;">// MyObject.m</span><br />
<span style="color:#CB0094;">@implementation</span> MyObject<br />
&#43;(<span style="color:#CB0094;">void</span>)myClassMethod<br />
{<br />
&nbsp;&nbsp;&nbsp;<span style="color:#007900;">/// your code</span><br />
}<br />
&#45;(<span style="color:#CB0094;">id</span>)myMethod<strong>:(<span style="color:#CB0094;">id</span>)val;</strong><br />
{<br />
&nbsp;&nbsp;&nbsp;<span style="color:#CB0094;">return</span> obj;<br />
}<br />
<span style="color:#CB0094;">@end</span>

更に複数の引数を渡したいのならば、可変長かラベルを利用する事になる。

註：Xcodeならインテリセンスが効くので、呼び出し時の変数の書き方に悩む必要はない。

### 可変長引数 {#variadic}
C における可変長と同じく、可変長引数を id 型とすれば

> &#43;(<span style="color:#CB0094;">void</span>)myClassMethod:(<span style="color:#CB0094;">id</span>)objects, ...;<br />

と書ける。

### ラベル（label） {#label}
Objective-C で最も一般的な複数引数の記述・利用法がラベルである。引数に名前を指定する。座標を渡すメソッドならば、

> [receiver <span style="color:#13484C;">myMethod</span>:val <span style="color:#13484C;">withX</span>:x <span style="color:#13484C;">withY</span>:y];<br />
&#45;(<span style="color:#CB0094;">id</span>)myMethod:(<span style="color:#CB0094;">id</span>)val withX:(<span style="color:#CB0094;">int</span>)x withY:(<span style="color:#CB0094;">int</span>)y;<br />

と書く。C の関数等で myMethod(val,num1,num2); と書くと引数の意味が取りづらいが、
Objective-C では上にある様に見た目に分かり易くなっている。

またこのラベルは同じメソッドで複数用意できる。
myMethod:withX:withY:withZ: なるメソッドを作りたいと思った時、myMethod:withX:withY: と myMethod:withX:withY:withZ: は共存できる。


### 命名規約（メソッド） {#methodname}
Cocoa API を見て行くと以下のような暗默の了解がある。一貫性は大事なので従っておこう。

NSString のメソッドを例にすると、

1. 初期化
  1. &#43; stringWithString:, &#43; stringWithUTF8String:, etc.<br />

特別なファクトリメソッド（簡易コンストラクタと言う）。戻り値は初期化されている。

  1. &#45; initWithString:, &#45; initWithUTF8String:, etc.<br />

特別なイニシャライザ（指定イニシャライザと言う）。init で始める。初期化については後述。

1. &#45; writeToFile:atomically:encoding:error:, &#45; writeToURL:atomically:encoding:error:<br />

writeTo はデータを書き出すメソッド名である。データは NSData にするのが一般的。

1. &#45; isAbsolutePath<br />

真偽値を返す場合に is で書き始める。

1. &#45; UTF8String, &#45; length, &#45; propertyList, etc.<br />

Objective-C における getter は get を付けない。一方 setter は set で書き始めても構わない。詳しくは Key-Value Coding Protocol を参照。

1. &#45; getLineStart:end:contentsEnd:forRange:, &#45; getCString:maxLength:encoding:<br />

get は getter ではなく、C のポインタを渡してインスタンスから値を取得する場合に用いる（つまり参照渡しの）メソッドである。

## レシーバ（receiver）/インスタンス（instance） {#receiver}
Objective-C のインスタンスは C のポインタなので、変数の型に * が必要。

> <span style="color:#641D9E;">NSObject</span> *obj = [[<span style="color:#641D9E;">NSObject</span> <span style="color:#370071;">alloc</span>] <span style="color:#370071;">init</span>];

### レシーバの初期化 {#init}
レシーバの初期化は上にあげた +alloc, -init がもっとも基本的な物であるが、ファクトリメソッドが用意されることもある。

alloc と init は NSObject で定義されており、Objective-C の根幹を成すメソッドの一つである。
alloc がレシーバにメモリを割り当て、init がこれを初期化する。

註：+new は、+alloc と -init を呼び出すのと同等。

### nil の扱い {#nilreceiver}
nil に存在しないメッセージを送信しても、余計なエラーが発生しない。

> [<span style="color:#CB0094;">nil</span> <span style="color:#13484C;">myMethod</span>];<span style="color:#007900;">// エラーにならない</span><br />
[receiver <span style="color:#13484C;">myMethod2</span>]; <span style="color:#007900;">// myMethod2が未定義ならばエラー</span>

## メモリ管理 {#gc}
Objective-C のメモリ管理は「参照カウント」と「ガベージコレクション」が用意される。ここでは参照カウントにまつわるメソッド、つまり NSObject に実装されている NSObject Protocol の +alloc、-init、-retain、-release、-autorelease、そして NSAutoreleasePool class を解説する。なおガベージコレクションを利用する場合は Mac OS 10.5 以降に導入されたため以前のバージョンと互換性がない事に注意。

1. alloc はメモリを割り当てたオブジェクトを返す。malloc 同様確保に失敗すれば nil を返す。生成されるオブジェクトの参照カウント は 1 となる。
1. init はオブジェクトを初期化する。Cocoa はこの二段構えにする事でオブジェクト生成に柔軟性を与えている。
1. retain はメモリ割り当てを解放しない為の手続きである。参照カウントを 1 増やす。
1. release はメモリ割り当てを解放する為の手続きである。参照カウントを 1 減らす。


一般に上から順に実行する。任意の瞬間にオブジェクトを解放するならば、retain によりカウンタを増し release によりカウンタを減らせばよい。release は参照カウントが 0 になればオブジェクトを解放してくれる。

註：-retainCount によりカウンタを取得できる。NSLog(@"%d", [receiver retainCount]); と呼び出して、カウンタの動作を確認して欲しい。

註：ガベージコレクションでは、nil を代入する事が、解放の目安となる。従って不要な変数には nil を代入すること。

註：iOS ではメモリが限られているためガベージコレクションが利用できない。

### 初期化とメモリ解放時の処理 {#allocation}
クラスの初期化には +load, +initialize を用いる。これはただ一度だけ呼び出される。+load は Runtime 上に追加された時に、+initialize は初めてそのクラスを用いる時に呼び出される。

インスタンスの初期化は -init 等の指定イニシャライザで行う。

メモリ解放時の処理は -dealloc, -finalize で行う。-dealloc は参照カウンタにおける解放、-finalize はガベージコレクタにおける解放で自動的に呼び出される。
ただし、必ず呼び出されると期待しない方がよく、アプリケーションの終了時に必要な処理を記述する事は避けた方がよい
（例えば、NSApplication に -terminate とすると、OS が強制的にメモリを回収するらしく、-dealloc を呼ぶ事がない）。

註：-dealloc は強制的にメモリを解放する手段ともなる。

### autorelease と NSAutoreleasePool {#rf888730}
上で示した仕組みでは時に問題が起こる。メソッドの戻り値としてメソッドが生成したオブジェクトを返す場合である。

> &#45;(<span style="color:#CB0094;">id</span>)myMethod<br />
{<br />
&nbsp;&nbsp;&nbsp;<span style="color:#641D9E;">NSObject</span> *val = [[<span style="color:#641D9E;">NSObject</span> <span style="color:#370071;">alloc</span>] <span style="color:#370071;">init</span>];<br />
&nbsp;&nbsp;&nbsp;<span style="color:#CB0094;">return</span> val;<br />
}<br />

このメソッドの戻り値を利用する場合、戻り値を取得した時点でカウンタは 1 となり、-release しなければ解放が起こらずリークする。<br />
この場合、autorelease を呼び、Autorelease pool に追加することで問題を解決できる。

> &#45;(<span style="color:#CB0094;">id</span>)myMethod<br />
{<br />
&nbsp;&nbsp;&nbsp;<span style="color:#641D9E;">NSObject</span> *val = [[<span style="color:#641D9E;">NSObject</span> <span style="color:#370071;">alloc</span>] <span style="color:#370071;">init</span>];<br />
&nbsp;&nbsp;&nbsp;<span style="color:#CB0094;">return</span> [val <span style="color:#370071;">autorelease</span>];<br />
}<br />

こうすると、Autorelease pool 上にあって且つカウンタが 1 となったインスタンスを取得できる。

註：以上の事から、指定イニシャライザで取得したインスタンスの場合は、代入的手段を直接行ってはならないとわかる。どうしてもその必要のある場合は、NSLog([[[[NSObject alloc] init] autorelease] description]); と、-autorelease の戻り値を利用する事で解決できる。

註：通常の開発では、NSApplication が NSAutoreleasePool のインスタンスを生成しているから、autorelease はこのままで動作する。
しかし Cocoa Application 以外の Cocoa を利用した開発では、自前の Autorelease pool を用意する必要がある。
また、任意に -drain を呼んでやる必要がでてくる。この -drain は pool のインスタンスに -release を送信する。

> NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];<br />
/* code */<br />
[pool drain];<br />

### 簡易コンストラクタ {#p4a641f9}
簡易コンストラクタは autorelease されたオブジェクトを返す。

### 指定イニシャライザ {#v02cdf0c}
指定イニシャライザは、実態が唯一でなければならず、しかも retain されているオブジェクトを返す。取得した側で責任を持ち release する必要がある。

### 戻り値の規約 {#n605ab08}

- &#43;alloc, &#43;allocWithZone:
- &#45;copy, &#45;mutableCopy, &#43;copyWithZone:, &#43;mutableCopyWithZone:


これらで取得する場合は retain されているので、プログラマの責任で release せねばならない。

## NSObject クラス {#g74b4db7}
Cocoa における Root class の一つ。

## プロトコル（protocol） {#z2525404}
Ruby における module みたいな奴。任意のクラスにいくらでも適用できる。手法は明示的なものと暗黙的なものの二種類ある。
## カテゴリ（category） {#pd8556d6}
定義済のクラスを拡張できる、Objective-C でも一・二を争う邪悪で、そして便利な手段である。例えば今 NSString に base64 encoding のメソッドをつけ加えてみたいと思うならば、カテゴリを用いることで実現できる。
## サブクラス（subclass） {#ta05093a}
## プロパティ（property） {#d8670d8d}
## よく使う構造体 {#id5b20c8}
以下の四つの構造体はよく使う。これらは KVC でも始めからサポートされる構造体で、特別な扱いを受けている。

1. NSSize

  - NSView 及びそのサブクラスでよく使うことになる。NSMakeSize。


1. NSPoint
1. NSRect
1. NSRange

  - 配列なんかで用いる。NSMakeRange で生成できる。


# 附録：Objective-C {#v8ad2bf8}
## ディレクティブ（directive） {#z984e5a5}
Objective-C におけるコンパイラ及びプリプロセッサへの命令について。C 標準は勿論のこと、いくらかの拡張がある。それが以下である。
### コンパイラのディレクティブ {#j3225b9a}

- #import
- //


\#import は #include に同じだが、一度しか読み込まない点が異なる。// は行末までコメント扱い。
### プリプロセッサのディレクティブ {#s52514b5}
クラス等は以下のように宣言する。

- @interface ～ @end
- @implementation ～ @end
- @protocol ～ @end


インスタンス変数の可視性は次の宣言で示す。

- @private
- @protected （初期設定）
- @public


例外処理は、

- @try
- @throw
- @catch()
- @finally


さらに以下が用意される。

- @class
- @selector(method_name)
- @protocol(protocol_name)
- @encode(type_spec)
- @"string"
- @"string1" @"string2" ... @"stringN"
- @synchronized()


一応説明が必要なのは @"string" であろう。@"string" は quoted な部位を NSString class のレシーバとして処理する構造である。@"abc" と書けば、abc なる文字を保持した NSString class のインスタンスが const として生成される。しかも（同じ stack であればだと記憶するが）@"string" を同メソッド内で何度呼びだしても、同じインスタンスを返してくれる。

註：インスタンス変数の可視性は、コンパイラが警告を出す申しわけ程度の物である。
どのみちカテゴリを用いればどんな変数であれ参照・変更が可能なのであり、可視性は無力化できてしまう。

註：Objective-C 2.0 から、@property, @synthesize, @optional, @required 等が追加された。

### 実行環境のはなし：Architecture について（32-64bit／PPC, Intel） {#xc4cf3a9}
### VMX（AltiVec） と SSE {#o2008692}
## C 言語との関連 {#q1055f75}
### const 及び static {#j0c52aa0}
@"string" でわかるように、const は使用可能。static は singleton で用いる。
### インスタンス変数の扱い {#j3f1c269}
インスタンス変数は C での構造体のメンバの様に宣言運用できる。例としてあげれば、@interface 中に int nums[10]; とできる。
## メソッドの静的呼び出し {#od53fcb9}
メソッドを呼び出す行為は、レシーバの情報から関数ポインタを取出し、それを呼び出しているに過ぎない。今 <objc/objc-class.h> を import した上で、


```
id obj = [self getObject];
Method method;
Class class = [self class];
SEL name = @selector(myMethod:);
method = class_getInstanceMethod(class, name);
method_getImplementation(method)(self, name, obj);
```


とすれば、これは [self myMethod:obj]; と同等である。
なお、メソッドを上書きしていなければ、self とは別のインスタンス等でも関数ポインタは同一である。NSLog(@"%p", method->method_imp); として確かめてみればよい。

# Cocoa {#w46bc7aa}
## Xcode（旧Project Builder） {#h871a571}
Mac OS X における標準的開発環境が Xcode とそのパッケージである。

## Xib (Nib) ファイルと Interface Builder {#vece2793}
Cocoa アプリケーションでは、GUI 部品（及び Controller Object）をシリアライズした Nib ファイルを読み込むことで、GUI 生成に関するコードを必要としない開発を実現している。またそれに関する Controller Object を含めることで、GUI 部品からのイベントやアクションへの対処が可能となる。

これらのファイルは、任意の瞬間に、任意の方法で読み込むことができる。

読み込まれた Nib ファイルにおいては、保存されたオブジェクトがインスタンス化され、インスタンス化後に NSNibAwaking Protocol の -(void)awakeFromNib が呼ばれる。

### NSMainNibFile {#b82ed230}
Project 中の info.plist の NSMainNibFile、或いは Xcode でターゲットを選択し『情報』ウインドウを開き『プロパティ』タブの『主要Nibファイル』、として指定されているファイル名が、Cocoa アプリケーション起動時に必ず読み込まれる Nib ファイルである。たとえば Menu Bar に表示される Main menu は主要Nibファイル中でシリアライズされている。

### アウトレット（Outlet）とアクション（Action） {#l95742c6}
【重要な内容ですが、ココに纏めて書きます】Outlet はインスタンス、Action はインスタンスのメソッド。

註：IBOutlet 及び IBAction は C のマクロである。IBOutlet はコンパイル時に無視され、IBAction は void * を表す。

### コントローラオブジェクト（Controller object） {#tdf38a4a}
Interface Builder の Library に Object と呼ばれる部品があるから、それをドロップすると、立方形のインスタンスが追加される。これがもっとも標準的なコントローラの追加方法である。コントローラの役目はいろいろあるが、例えば GUI 部品へのアクションは、大抵の場合、こうして追加したコントローラに送信することになる。

例：

1. Xcode で新規プロジェクトを選択し、適当な名前の Cocoa Application Project を作る。
1. 次に新規ファイルを選び、ヘッダを含めて AppController クラスを追加して欲しい。AppController の superclass は NSObect でよい。
1. AppController.h を編集し、AppController クラスへ -(IBAction)myMessage:(id)sender; を追加する。
1. AppController.m の AppController クラスには -(IBAction)myMessage:(id)sender{NSLog(@"HELLO WORLD");} と追加する。
1. MainMenu.xib を開く（恐らくテンプレート通りならこのファイル名である）。すると、File's Owner・First Responder 等と表示された Window と、別の何もない Window が表示される。
1. Library の Buttons から、Gradient Button を選び、何もない Window にドラッグして乗せる。これで保存すれば、ボタンが追加されている。
1. Library の Object & Controller から、Object を選び追加する。今度は何もなかった Window ではない方へ追加する。
1. 次に初期設定では NSObject の インスタンスであるから、Class Identify の Class を AppController にする。
1. Gradient Button の Sent Actions の selector に myMessage: を設定する。勿論ターゲットは AppController。Control-Key を押しながら、クリックしてみると・・・？


Interface Builder の使い方は言葉では表現しづらい。一応全て終了したならば、「ビルドと実行」を選び、起動させる。Xcode の「実行 > コンソール」からコンソールを開き、表示されたウインドウのボタンをクリックするとメッセージが表示される筈である。このコンソールには、NSLog の出力の他にエラーメッセージ等も表示されるから、出力には常に注意を払うこと。

参考：

- [Cocoa Fundamentals Guide](http://developer.apple.com/jp/documentation/Cocoa/Conceptual/CocoaFundamentals/)
- [Cocoaアプリケーションチュートリアル](http://developer.apple.com/jp/documentation/Cocoa/Conceptual/ObjCTutorial/)


基本的なことが書いてある。『Cocoa Fundamentals Guide > オブジェクトとの通信 > ターゲットとアクションの設定』をみること。

註：Cocoa Fundamentals Guide にもあるが、コードでアクションとターゲットを設定することもできる。 NSMainNibFile や Nib ファイルについて上で書いたように、


```
//   AppController.h
@interface AppController : NSObject
{
      IBOutlet NSButton *button;

//   AppController.m
-(void)awakeFromNib{
      [button setTarget:self];
      [button setAction:@selector(myMessage:)];
}
```


と書き加え、定義した outlet が機能するようにボタンへ接続しておけばよい。outlet の接続を行うことで、
GUI 部品のインスタンスをコントローラ上で取得できるようになる。

課題：『参考』『註』を見ながら、ウィンドウに先程のボタンを無効にするボタンを新たに追加すること。新たなアクションメソッドを必要とする筈である。なお、NSButton には、superclass の NSControl において -setEnabled:(BOOL)flag が定義されている。<span style="font-size:9px;">・・・・課題風にするなら、独立したページでチュートリアル式にした方が宜しいかもしれない。</span>

### File's Owner {#mb20f88d}
Nib ファイルにはその所有者である File's Owner が必ず設定される。それは、

- NSMainNibFile においては NSApplication。
- Document-based Application の Document 用 Nib ファイルでは NSDocument のサブクラス。
- Window 用 Nib ファイルでは、NSBundle の +loadNibNamed:owner: で指定した物か、或いは NSWindowController のサブクラス。
- Custom View 用 Nib ファイルでは、適当な Object、或いは NSViewController のサブクラス。


等である。

### First Responder {#sace8878}
標準でかなり多くのアクションが Main menu から設定されているが、これら全ては最終的に他のオブジェクトへの呼び出しとなる。その仕組みは responder chain と呼ばれる。
## バインディング（Binding） {#d75a1c73}
10.3 あたりから導入された憶えがある。面倒なので解説丸投げ。

- [Cocoa Binding : バインディングって何なのさ](http://sitearo.com/cocoa/1100_binding/01_whats/)


## 通知（Notification） {#w12f5991}
## Foundation Framework {#i8aa10b0}
文字通り基礎的な API。主要なデータ型のクラスが定義されてたり、その他 Cocoa の拡張にあわせて機能が追加されたり。

## AppKit Framework {#kab41712}
Application Kit (AppKit) には、さまざまな御約束がある。ある程度馴れてくると、ヘッダをみて、通知や委譲がないか確かめたり、クラスの使い方がわかるようになる。
## CoreData Framework {#pc166909}
## 二三の重要なプロトコル {#v3043586}
### NSObject Protocol {#o8819deb}

- [NSObject Protocol Reference](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/)


### NSKeyValueCoding Protocol と NSKeyValueObserving Protocol {#da4d02be}
Protocol と呼ばれてはいるが、どちらかというと、文法として組み込まれていると考えてよい。setter、getter による binding と監視を実現する。

- [NSKeyValueCoding Protocol Reference](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSKeyValueCoding_Protocol/)
- [NSKeyValueObserving Protocol](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSKeyValueObserving_Protocol/)

### NSFastEnumeration Protocol {#b8b87c43}
10.5 以降で追加。高速列挙できる。コンパイル時に Obj-C から C 的な表現に置き換わるので、やや早い。

- [NSFastEnumeration Protocol Reference](http://developer.apple.com/library/mac/#documentation/cocoa/reference/NSFastEnumeration_protocol/)

### NSCoding Protocol {#o16d5326}
NSDocument Class を使ったアプリケーションで書類を保存する時なんかに大活躍。NSKeyedArchiver, NSKeyedUnarchiver Class とあわせて使う。

- [NSCoding Protocol Reference](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSCoding_Protocol/)

### NSCopying Protocol と NSMutableCopying Protocol {#h1b3bb41}
インスタンスをコピーするための手続き。shallow か deep かは実装まかせ。

- [NSCopying Protocol](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSCopying_Protocol/)
- [NSMutableCopying Protocol](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Protocols/NSMutableCopying_Protocol/)

## ローカライズ（Localization） {#k00f48e1}
Mac OS X の Install DVD は世界共通であると云うと、些かの驚きを持たれるかもしれない。これはそれを実現する方法論である。実際、システム環境設定を変更し再起動すれば、直ぐにでも、表記が English や Français に切り替わる。

長くなるので丸投げ。その内、NSBundle Class の仕組みと strings の使い方ぐらいは書く。

- [Internationalization and Localization](http://developer.apple.com/internationalization/)


## ユーザ設定 {#n90a78bb}
NSUserDefaults Class では、~/Library/Preference に設定ファイルを保存、そこからの設定の読込、を行う。+standardUserDefaults で共有のインスタンスを呼び出せる。
