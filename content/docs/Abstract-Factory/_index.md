---
title: "Abstract Factory"
date: 2026-10-21T06:47:06+09:00
lastmod: 2026-10-21T06:47:06+09:00
slug: "Abstract-Factory"
draft: false
---

[デザインパターン](/docs/デザインパターン)

抽象生成構造（アブストラクトファクトリパターン）とでも言える。抽象とは何ぞやといった時に、抽象化されるのはこのファクトリメソッドのインスタンスを使用する過程が抽象化されると言える。

単純生成構造（ファクトリメソッド）では呼び出したメソッドが任意のクラスのインスタンスを生成して返す訳だが、抽象生成構造（アブストラクトファクトリメソッド）では更に「任意」のクラスのインスタンスを生成して返すことになる。


## Cocoa での例 {#kf36ec7c}
Objective-C の Cocoa API に定義される NSString（及び CFString、NSCFString）クラスをみる。表記体系が独特なので PHP でコードすると、NSString や CFString は次のように呼び出すことになる。

```
NSString::stringWithCString("任意のC文字列（char）","文字セットを示す定義");
CFStringCreateWithCString(kCFAllocatorDefault,"任意のC文字列（char）","文字セットを示す定義");
```


CFStringCreateWithCString は Carbon API のクラスで、kCFAllocatorDefault は CFString クラスを生成したものが入っている。Carbon は C の API であるので、こういう風にインスタンスを渡すことでオブジェクト指向を表現する訳だ。ともかく、これらのコードは Mac OS X のアプリケーションでは共存可能であるということと、Cocoa API は Carbon API にラップされているらしいことを認識して欲しい。両者とも NSCFString（実際には更にそのサブクラス）というクラスが返され、これに対して指示を出すことになる。

stringWithCString というメソッドでは、Carbon にラップ可能な時はラップするように実は裝されるため、そう実裝される。他のクラス体系のファクトリメソッドを呼ぶ。こういった集約構造を抽象生成構造など呼ぶ。具体的なインスタンス生成行程は別の所にあるのだと認識して欲しい。分ったような分らなかったような話でしたとさ。

## 結局抽象って何なのさ {#l51845c4}
君だって自分の作った API 群があったとして、その複雜な継承関係であるとかを意識して単純生成（ファクトリメソッド）をするのは馬鹿げていると思わないか。今後、他のクラスインスタンスを生成したくなった時に、全てのコードをそのクラスのファクトリメソッドを使用するように書き続けるのは現実的ではないと思わないか。

これは予めそういった手段を考慮するものである。後者の例を PHP で挙げる。

```
class decrepitFactory{
 static function factory(){
  return new self;
  }
 }

class freshFactory{
 static function factory(){
  return new self;
  }
 }

# 現在の実裝コードの状況
$obj = decrepitFactory::factory();
$obj->method..... # 以下処理が続く
```


「decrepitFactory::factory」で呼び出す箇所は無数、至る所に及ぶ可能性は捨て切れない。もしこれを違うクラスで実裝したい、「freshFactory::factory」、と思っていても相当に手間である。
そこで最初から抽象化する事で解決できる。


```
class abstractFactory{
 static function factory(){
  # なんらかの判断に基づき条件分岐
  return decrepitFactory::factory();
  # 分岐
  return freshFactory::factory();
  }
}
```


これで解決できた。OS、使用する言語バージョンでの分岐。分ける基準は色々ある。けれどもコードの上では「abstractFactory::factory」とするだけでクラスインスタンスが返される。ファクトリメソッドを變へることで苦悩することは無くなった。

更に言うと、abstractFactory で大枠を実裝して、freshFactory や decrepitFactory は abstractFactory のサブクラスなどにする手段も考えられる。具体的なクラス名を意識することなく使用するのが主眼なので、同じメソッドを実装すると良い。freshFactory だらうが decrepitFactory だらうが、然るべきメソッドは然るべき処理を施す。それが重要。

この感覚はアダプタに近い所がある。データベースの種類を自動的に判別して接続するアダプタを切替えるとか。


20091226
中身は良いのに、変に旧字を使っていて読みにくかったので修正しました。
