---
title: "Scala"
date: 2026-07-22T05:29:32+09:00
lastmod: 2026-07-22T05:29:32+09:00
slug: "Scala"
draft: false
---

# Scala解答例 {#top}

[練習問題](/docs/練習問題)

解答例は次の環境でテストしています

- Scala version 2.11.6
- Java(TM) SE Runtime Environment (build 1.8.0_40-b25) 64-bit
- sbt 0.13.8


ほとんどの解答例は[ideone.com](http://ideone.com/)でそのまま実行できます

つっこみは[Top](/)の避難所まで


## [ループ練習](/docs/練習問題#eb2c4338) {#s1c6b422}
### 問1 {#ke7969de}

```
object Main extends App {
  for (i <- 1 to 5) {
    println("Hello World!")
  }
}
```


別解

```
object Main extends App {
  (1 to 5) foreach { _ =>
    println("Hello World!")
  }
}
```


### 問2 {#ybb0b896}

```
object Main extends App {
  val j = args(0).toInt

  for (i <- 1 to j) {
    println("Hello World! " + i)
  }
}
```


別解

```
object Main extends App {
  val j = args(0).toInt

  (1 to j) foreach { i =>
    println("Hello World! " + i)
  }
}
```


## [FizzBuzz](/docs/練習問題#t52e5a48) {#ga808233}

```
object Main extends App {
  def fizzBuzz(n: Int) =
    if (n % 15 == 0) {
      "FizzBuzz"
    } else if (n % 5 == 0) {
      "Buzz"
    } else if (n % 3 == 0) {
      "Fizz"
    } else {
      n.toString
    }

  (1 to 100).map(fizzBuzz).foreach(println)
}
```


## [素数判定](/docs/練習問題#prime) {#prime}
### 判定 {#is-prime}

```
object Main extends App {
  def prime(n: Int) =
    2 <= n && !(2 until (math.sqrt(n) + 1.0).toInt).exists(n % _ == 0)

  val n = args(0).toInt

  println(n.toString + "は" + (if (prime(n)) "素数" else "非素数"))
}
```


### 列挙 {#list-primes}

```
object Main extends App {
  def primes(xs: Stream[Int] = Stream.from(2)): Stream[Int] =
    xs.head #:: primes(xs.tail.filter(_ % xs.head != 0))

  primes() takeWhile {
    _ <= 100
  } foreach {
    println
  }
}
```


## [うるう年測定](/docs/練習問題#i0d67516) {#xd158eb1}

```
import java.util.GregorianCalendar

object Main extends App {
  val cal = new GregorianCalendar()

  while (true) {
    print("西暦を入力してください> ")
    val y = readInt()
    if (y <= 0) sys.exit()

    printf("%dはうるう年%s\n", y,
      if (cal.isLeapYear(y)) "です" else "ではありません")
  }
}
```


## [転置行列](/docs/練習問題#q9f27a17) {#o9735320}

```
import scala.annotation.tailrec

object Main extends App {
  type Mx = List[Array[String]]

  @tailrec
  def matrix(xs: Mx = Nil): Mx = {
    val sep = """\s+""".r
    val s = readLine()
    if (s.length <= 0) xs else matrix(xs :+ sep.split(s))
  }

  matrix().transpose.foreach(x => println(x.mkString(" ")))
}
```


## [カレンダー出力](/docs/練習問題#i5e3e061) {#xde7305e}

- build.sbt


```
name := "vipcal"
    
version := "1.0"
    
scalaVersion := "2.10.2"

libraryDependencies ++= Seq(
    "org.scala-lang" % "scala-swing" % "2.10.2",
    "org.swinglabs.swingx" % "swingx-core" % "1.6.5-1"
)
```


- Main.scala


```
import scala.swing._
import org.jdesktop.swingx.{JXDatePicker, JXMonthView}
import java.awt.event.{ActionEvent, ActionListener}

object Main extends SimpleSwingApplication {
  override lazy val top = new MainFrame with ActionListener {
    self =>

    val monthView = new JXMonthView()
    val datePicker = new JXDatePicker(monthView.getToday)

    datePicker.addActionListener(self)

    contents = new BoxPanel(Orientation.Vertical) {
      contents += Component.wrap(datePicker)
      contents += Component.wrap(monthView)
    }

    def actionPerformed(e: ActionEvent) {
      val d = datePicker.getDate
      monthView.setFirstDisplayedDay(d)
      monthView.setFlaggedDates(d)
    }
  }
}
```


<div class="pukiwiki-ref"><img src="http://i.imgur.com/uAqI9dn.png" alt="カレンダー" /></div>


## [配列いじり](/docs/練習問題#w5561ad6) {#ode26856}

```
object Main extends App {
  def tailZero(xs: Array[Int]) =
    xs.head +: Array.fill(xs.tail.size){ 0 }

  val a = Array(3, 5, 2, 4, 2)

  println(a.mkString(" "))
  println(tailZero(a).mkString(" "))
}
```


## [Caesar暗号解読](/docs/練習問題#h54a0395) {#g5a75e45}

```
object Main extends App {
  val ciphertext =
    """qdq-gi.q-a ziatmxxitmdqibtqi-ustbi ri.qmoqrcxi.qbubu zir
      |-ibtqi-qp-qaai ripmymsqkir -ibtqi-qy dmxi ri.cnxuoi rruoumxakir
      |-ibtqiqzmobyqzbki-q.qmxi -imyqzpyqzbi rixmeaki -puzmzoqai
      |-i-qscxmbu zaimzpir -i btq-iymbbq-a;iz -iatmxximzgi.q-a
      |zinqiuzimzgiemgipuao-uyuzmbqpimsmuzabir -ia. za -uzsiacotimi.qbubu zj""".stripMargin.filter(_ != '\n')

  val chars = """abcdefghijklmnopqrstuvwxyz .,-"""

  def rot(s: String, count: Int) =
    s.splitAt(s.length - count - 1) match {
      case (a, b) => b + a
    }

  (1 until chars.length) map {
    i => chars.zip(rot(chars, i)).toMap
  } map {
    p => ciphertext.map(c => p.getOrElse(c, c))
  } filter(_.contains("person")) foreach {
    println
  }
}
```


## [フィボナッチ数列](/docs/練習問題#p59f794f) {#v6061921}

```
import scala.annotation.tailrec

object Main extends App {
  @tailrec
  def fibs(a: Int, b: Int)(n: Int): Int =
    n match {
      case 0 => a
      case _ => fibs(b, a + b)(n - 1)
    }
  val fib = fibs(0, 1) _

  val n = args(0).toInt

  printf("%d: %d\n", n, fib(n))
}
```


## [ひらがな2文字をランダムで出力するプログラム](/docs/練習問題#s98f80e0) {#r8373c52}

```
import java.util.Random

object Main extends App {
  val first = 'ぁ'.toInt
  val last = 'ん'.toInt

  val rnd = new Random()

  def randomHiragana = Array.fill(2)((first + rnd.nextInt(last - first + 1)).toChar).mkString("")

  for (i <- 0 until 10) {
    println(randomHiragana)
  }
}
```


## [配列から大きい要素とその添字を求めるプログラム](/docs/練習問題#u170a96a) {#y312d087}

```
object Main extends App {
  val array = Array(12, 6, 8, 3, 10, 1, 0, 9)

  array.zip(array.indices).sortBy(_._1).reverse.take(3) foreach {
    i => printf("%d -> %d\n",i._2, i._1)
  }
}
```


## [累乗](/docs/練習問題#x6e30de3) {#t3a731fd}
### 課題1 {#k9aa5b74}

```
object Main extends App {
  def pow(a: Int, n: Int): BigInt = {
    var x = BigInt(1)
    var i = n
    while (i > 0) {
      x = x * a
      i -= 1
    }
    x
  }

  println(pow(2, 0))
  println(pow(2, 1))
  println(pow(2, 2))
  println(pow(2, 10))
  println(pow(2, 1024))
  println(pow(2, 1000007))
}
```


### 課題1(Stream版) {#r285d3c4}

```
object Main extends App {
  def pow(a: Int, n: Int) = {
    val x = BigInt(a)
    Stream.fill(n)(x).product
  }

  println(pow(2, 0))
  println(pow(2, 1))
  println(pow(2, 2))
  println(pow(2, 10))
  println(pow(2, 1024))
  println(pow(2, 1000007))
}
```


### 結果 {#ef174388}

```
1
2
4
1024
179769313486231590772930519078902473361797697894230657273430081157732675805
500963132708477322407536021120113879871393357658789768814416622492847430639
474124377767893424865485276302219601246094119453082952085005768838150682342
462881473913110540827237163350510684586298239947245938479716304835356329624
224137216
126728399734987497608933422288664361609390390294880861860689870266005881386
中略
4810776629789295701471878694639518221425715604831630000128
```
