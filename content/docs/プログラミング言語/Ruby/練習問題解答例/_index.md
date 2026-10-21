---
title: "練習問題解答例"
date: 2026-07-11T16:58:17+09:00
lastmod: 2026-07-11T16:58:17+09:00
slug: "練習問題解答例"
draft: false
---

[プログラミング言語/Ruby](/docs/プログラミング言語/Ruby)


# 初心者用課題 Ruby版 {#z0839d58}
問題の詳細については
[練習問題](/docs/練習問題)を参照。

# 素数判定 {#u543d3a3}
ま　さ　に　外　道(I)

```
require 'mathn.rb'

class PrimePredicater
  def initialize
    @prime = Prime.new
    @cache = []
  end
  
  def prime?(x)
    extend_cache x if @cache.empty? || x > @cache.last
    @cache.include? x
  end
  
private
  def extend_cache(lim)
    @prime.each do |x|
      break if x > lim
      @cache.push x
    end
  end
end

#使用例
ppred = PrimePredicater.new
[1, 10, 2, 5, 7].each do |x|
  p ppred.prime?(x)
end
```


# 素数を求める {#e48df6ac}

100までの素数を列挙する。

エラトステネスのふるい:

```
# limitまでの素数について繰り返しをする
def eratosthenes_sieve(limit, &block)
  return enum_for(__method__, limit) unless block_given?
  primes = [2]
  nums = (primes.last..limit).to_a
  loop do
    nums.delete_if{|x| x % primes.last == 0 }
    break if nums.empty?
    break if nums.last < primes.last ** 2
    yield(nums.first)
    primes << nums.first
  end
  nums.each(&block)
end

puts eratosthenes_sieve(100).to_a.join(' ')
```


↑は2を素数と言ってくれないので、書きかえた。1,000,000まで。1.9.3p392で確認。

```
def eratosthenes_sieve(limit)
  sq = (limit ** 0.5).to_i
  is_prime = [false, false] + [true] * (limit-1)
  2.upto(sq+1) { |i|
    if is_prime[i]
    (i*i).step(limit, i) { |j|
      is_prime[j] = false
    }
    end
  }
  res = []
  2.upto(limit) { |i|
    res.push(i) if is_prime[i]
  }
  return res
end

puts eratosthenes_sieve(1e6.to_i).join(' ')
```


ライブラリを用いた解法

Ruby1.8.7:

```
require 'mathn'
puts Prime.new.enum_for(:each).take_while{|n| n <= 100 }.join(' ')
```


Ruby1.9:

```
require 'mathn'
puts Prime.each.take_while{|n| n <= 100 }.join(' ')
```


Ruby1.9:

```
 require 'prime'
 puts Prime.each(100).to_a
```


# うるう年測定 {#r3e10171}

まっとうな例:

```
# 
# * 4の倍数であれば閏年
# * ただし、100の倍数でもある場合、
#   400の倍数でもあるならば閏年
# 
def leap_year?(y)
  return false unless y % 4   == 0
  return true  unless y % 100 == 0
  y % 400 == 0
end

begin
  ARGV[0] or raise 'missing year'
  # Integer()は数値表現とは見えない文字列が与えられた場合、
  # #to_iと違い、ArgumentErrorを発生させます。
  y = Integer(ARGV[0])
  y >= 0 or raise "invalid year: #{y}"
  puts "#{y}: #{leap_year?(y)}"
rescue => ex
  # 例外を捕まえて、エラーメッセージと使い方を喋って終わる
  me = File.basename($0, '.rb')
  $stderr.puts "#{me}: #{ex}"
  $stderr.puts "Usage: #{me} YEAR"
end
```


変態な例:

```
LEAP_YEAR_CHART = {
  # x4?
  true => {
    # x100?
    true => {
      # x400?
      true =>  true,
      false => false,
    },
    false => {
      true =>  true,
      false => true,
    }
  },
  false => {
    true => {
      true =>  false,
      false => false,
    },
    false => {
      true =>  false,
      false => false,
    }
  }
}

def leap_year?(y, chart)
  [4, 100, 400].inject(chart){|r, i| r[y % i == 0] }
end

begin
  ARGV[0] or raise 'missing year'
  y = Integer(ARGV[0])
  y >= 0 or raise "invalid year: #{y}"
  puts "#{y}: #{leap_year?(y, LEAP_YEAR_CHART)}"
rescue => ex
  me = File.basename($0, '.rb')
  $stderr.puts "#{me}: #{ex}"
  $stderr.puts "Usage: #{me} YEAR"
end
```


# ハノイの塔 {#r9efcc5f}

```
#Usage: ruby hanoi.rb [n number of disc]

=begin
= Hanoiクラス
「ハノイの塔」の問題を解くクラス。

== クラスメソッド
--- Hanoi.new(num, :from => "From", :to => "To", :work => "Work")
    Hanoiクラスを生成する。numは積まれている円盤の枚数。
    fromなどのキーワード引数(もどき)はnumの後に書く必要がある。
    問題に使用する円盤を差す棒の名前。

== インスタンスメソッド
--- height
--- from
--- to
--- work
    それぞれ、new時に与えた問題の設定を参照する。heightは初めにfromに
    積まれている円盤の数。

--- each{|n, from, to| ... }
    再帰的に問題を解いている様子を一回ずつ監視する。
    nは動かす円盤の番号、それをfromからtoへと動かしている。
    円盤nとはn番目に小さい円盤のこと。

=end

class Hanoi
  def initialize(n, h)
    @height = n
    @from   = h[:from] || "From"
    @to     = h[:to]   || "To"
    @work   = h[:work] || "Work"
  end
  
  attr_reader :height, :from, :to, :work
  
  def each(&block)
    do_hanoi @height, @from, @to, @work, &block
  end
  
  private
  
  def do_hanoi(n, from, to, work, &block)
    if n == 1
      yield n, from, to
    else
      do_hanoi n - 1, from, work, to, &block
      yield n, from, to
      do_hanoi n - 1, work, to, from, &block
    end
  end
end


##使用例
num = (ARGV[0] || 3).to_i
num >= 0 or raise "#{num}: Invalid Number"
hanoi = Hanoi.new(num, :from => "A", :to => "B", :work => "C")
hanoi.each do |n, from, to|
  puts "#{n}: #{from} -> #{to}"
end
```


# 転置行列 {#o1ceec0c}

```
require 'matrix'

def parse_matrix(src)
  matrix = []
  src.each do |line|
    line.chomp!
    next if line.empty?
    matrix.push line.split(/\s+/).map{|x| x.to_i }
  end
  Matrix.rows(matrix)
end

m = parse_matrix(ARGF.read)
puts m.transpose.to_a.map{|v| v.join(" ") }
```


# 数当てゲーム {#b1a863ae}

```
require 'readline'

def usage
  puts "Usage: ruby #{File.basename($0)} DIFFICULTY[=1]"
end

def main
  return usage() if ['-h', '--help'].any?{|h| ARGV.include?(h) }
  srand()
  difficulty = Integer(ARGV[0] || 1)
  difficulty >= 1 or raise "invalid difficulty: #{difficulty} (must be >= 1)"
  puts "[difficulty #{difficulty}]"
  correct = rand(10 * difficulty + 1)
  error_handling(true) do
    times = 0
    while line = Readline.readline("guess? > ", true)
      return give_up() if line.strip == 'g'
      try = Integer(line)
      times += 1
      comp = case
        when correct == try then return result(try, times)
        when correct >  try then 'smaller'
        when correct <  try then 'bigger'
      end
      puts "#{try} is #{comp}. (put `g' to give up)"
    end
  end
end

def give_up
  puts "give up!"
end

def result(answer, times)
  puts "#{answer} is correct!"
  puts "you tried to guess #{times} times."
end

def error_handling(continue = false)
  yield
rescue => ex
  me = continue ? '' : "#{File.basename($0, '.rb')}: "
  puts "#{me}#{ex.message}"
  continue ? retry : exit(1)
end

error_handling{ main }
```


# 数当てゲーム その２(Hit&Blow) {#od23e209}
ルールの補足に合わせて改訂。

```
def help
  warn <<-HELP
hit_and_blow.rb: play Hit & Blow game.
usage: ruby hit_and_blow.rb [-option] [DIFFICULTY]

  h, --help     show this help
  v, --version  show version
  HELP
  exit 0
end

def version
  warn "hit_and_blow 0.0.1"
  exit 0
end


require 'readline'
srand

#n桁以下の数を乱数生成
def generate_answer(col)
  bottom = 10 ** (col - 1)
  rand(10 ** col - bottom) + bottom
end

#答えの数の妥当性チェック(全桁の数がユニークか)
def valid_answer?(n)
  n.to_s.split(//).uniq! ? false : true
end

def generate_valid_answer(col)
  answer = nil
  loop do
    answer = generate_answer(col)
    valid_answer?(answer) and break
  end
  answer
end


#数を桁ごとに分ける(col指定で0補完)
def num_split_cols(n, col=nil)
  width = col || n.to_s.length
  sprintf("%0#{width}d", n).split(//).map{|n| n.to_i }
end


def input_number(prompt)
  while line = Readline.readline(prompt, true)
    n = line.to_i
    if n < 0
      warn "do not input negative number."
    else
      yield n
    end
  end
end


ARGV.delete_if do |x|
  case x
  when "-h", "--help"
    help
  when "-v", "--version"
    version
  end
end


n = (ARGV[0] || 4).to_i
n > 0 or raise "#{n}: Invalid difficulty specification."
answer = generate_valid_answer(n)
answer_set = num_split_cols(answer, n)
p answer if $DEBUG


result = []
def result.clear(width)
  fill(0, 0, width)
end
def result.count(n)
  join.count(n.to_s)
end
result.clear(n)


input_number("try! >") do |reply|
  reply_set = num_split_cols(reply, n)
  
  #check `Hit'
  reply_set.each_with_index do |r, i|
    result[i] += 1 if r == answer_set[i]
  end
  
  #check `Blow'
  reply_set.each_with_index do |r, i|
    result[i] += 1 if answer_set.include?(r)
  end
  
  hit, blow = result.count(2), result.count(1)
  print "#{hit} Hit  &  #{blow} Blow\n"
  break if hit == n
  result.clear(n)
end
```


# FizzBuzz {#xb9545ca}

```
def fizz_buzz(n)
  ret = "#{["Fizz"][n % 3]}#{["Buzz"][n % 5]}"
  ret.empty? ? n.to_s : ret
end

puts (1..100).collect{|n| fizz_buzz n }
```


# カレンダー出力 {#v8444f3a}

```
#使い方: コマンドラインにテキトーに日付を入れで動かす

require 'optparse'
require 'time'
require 'forwardable'
require 'stringio'



class Month
  extend Forwardable
  
  [:Sunday, :Monday, :Thuesday, :Wednesday,
    :Thursday, :Friday, :Saturday].each_with_index do |const, n|
    const_set const, n
  end
  
private
  def initialize(datum)
    @datum = datum
    @days = [nil]
    load_days datum, @days
  end
  
  def load_days(datum, days)
    1.upto(31) do |day|
      date = Time.local(datum.year, datum.month, day)
      break unless date.month == datum.month
      days.push date
    end
  end
  
public
  def_delegators "@datum", :year, :zone
  
  def name(abbrev=false)
    @datum.strftime(abbrev ? "%b" : "%B")
  end
  
  def_delegators "@days", :[], :first, :last
  
  def each
    @days.each{|d| yield d }
  end
end


class CalenderRender
  def initialize(mon)
    @mon = mon
  end
  
  def run(port=$stdout)
    weeks = calender_matrix(@mon)
    show_calender header_render(@mon) + calender_render(weeks)
  end
  
private
  def show_calender(src, port=$stdout)
    port.print src
  end
  
  def calender_matrix(mon)
    weeks = []
    week = Array.new(7)
    1.upto(mon.last.day) do |n|
      week[mon[n].wday] = mon[n].day
      if mon[n].wday == Month::Saturday
        weeks.push week
        week = Array.new(7)
      end
    end
    weeks.push week
    weeks
  end
end


class CUICalenderRender < CalenderRender
private
  def calender_matrix(mon)
    weeks = super
    weeks.unshift %w[Sun Mon Tue Wed Thu Fri Sat]
    weeks
  end
  
  def header_render(mon)
    col = 3 * 7 + (7 - 1)
    cap = "#{mon.name}, #{mon.year}"
    padding = (col - cap.length) / 2
    head = sprintf("%#{padding}s%s%#{padding}s", "", cap, "")
    sprintf("%#{col}s\n", head)
  end
  
  def calender_render(weeks)
    weeks.collect{|week|
      if week.all?{|day| day.nil? }
        ""
      else
        week.collect{|day| sprintf("%3s", day.to_s)}.join(" ")
      end
    }.join("\n")
  end
end


class HTMLCalenderRender < CalenderRender
  def header_render(mon)
    h = "#{mon.name}, #{mon.year}"
    <<-HTML
<!-- generated by calender.rb -->
<?xml version="1.0" ?>
<!DOCTYPE html 
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>#{h}</title>
</head>
<body>
<table>
  <tr>
    <th colspan="7">#{h}</th>
  </tr>
    HTML
  end
  
  def calender_render(weeks)
    buf = StringIO.new
    weeks.each do |week|
      buf.puts "\t<tr>"
      week.each do |day|
        buf.puts "\t\t<td>#{day}</td>" if day
      end
      buf.puts "\t</tr>"
    end
    buf.puts "</table>\n</body>\n</html>"
    buf.string
  end
end


class GUICalenderRender < CalenderRender
  #作成中
end



render_class = CUICalenderRender
render_class_table = {
  "cui"  => CUICalenderRender,
  "gui"  => GUICalenderRender,
  "html" => HTMLCalenderRender
}

op = OptionParser.new
op.on("-m MODE", "--show-mode=MODE",
        "specify calender type(cui|gui|html)"){|v|
      render_class = render_class_table[v.downcase] || CUICalenderRender
}

op.on("-h", "--help", "show this help"){
  warn op.help
  exit 0
}
op.on("-v", "--version", "show version"){
  warn "calender.rb 0.0.1"
  exit 0
}

op.parse!(ARGV)

if ARGV.size > 1
  ARGV.replace [ARGV.join("/")]
end

datum = ARGV[0] ? Time.parse(ARGV[0]).getlocal : Time.now


mon = Month.new(datum)
render = render_class.new(mon)
render.run
```


# 配列いじり {#d5c23dc0}

```
def exclude_without_first!(array)
  fst = array.first
  array.fill(0)
  array[0] = fst
  array
end
```


# Caesar暗号解読 {#h97ae94f}
総当り法による力任せ解読。

```
### Usage: ruby caesar.rb HINT [CODE_FILE]

module CaesarCode
  class CharTable
    def initialize(char_set)
      @char_set = char_set
      @shifted = char_set.dup
      @shift_count = 0
      def @shifted.rotate
        temp = self.shift
        self.push temp
        self
      end
      @table = {}
      init_table
    end
    
    attr_reader :shift_count
    
    def [](key)
      @table[key]
    end
    
    def shift
      @shifted.rotate
      init_table
      @shift_count += 1
      self
    end
    
  private
    def init_table
      @table.clear
      @char_set.zip(@shifted).each do |x|
        @table[x[0]] = x[1]
      end
    end
  end
end



def convert(base, table)
  base.split(//).collect{|x| table[x] or x }.join("")
end

raise ArgumentError, "hint word not given" if ARGV.empty?
hint = ARGV.shift
char_set = "abcdefghijklmnopqrstuvwxyz .,-".split(//)
table = CaesarCode::CharTable.new(char_set)
src = ARGF.read
org = src[0]

until src.include?(hint)
  src = convert(src, table.shift)
  raise "can't decode" if org == src[0]
end

print src
print "鍵(シフト数)は #{table.shift_count} です\n"
```


# ファイル読み込んで標準出力に出す {#ib80ae4e}

```
begin
  puts IO.readlines("kadai.txt").map{|line| "[#{line.chomp}]" }
rescue => ex
  warn ex.message
end
```


# Base64 {#q2bfc331}

```
require 'stringio'

def version
  warn "base64.rb 0.0.1"
  exit 0
end

def help
  warn <<-HELP
base64.rb: Base64 encoder/decoder
usage: ruby base64.rb MODE [filenames ...]

MODE:
  encode : ordinary file to Base64 format
  decode : Base64 format to original file
  none   : print not convert one
  HELP
  exit 0
end


proc_tbl = {
  :encode => proc{|org| [org].pack("m") },
  :decode => proc{|org| org.unpack("m").first },
  :none => proc{|org| org }
}

opt_mode = []

ARGV.delete_if do |x|
  case x
  when "encode", "decode", "none"
    opt_mode.push x.intern
  when "-h", "--help"
    help
  when "-v", "--version"
    version
  end
end

opt_mode.empty? and opt_mode.push :none
opt_mode.size == 1 or raise "Too many mode specification"
mode = opt_mode.first

$stdin.binmode
$stdout.binmode

def argf_imitate(argv, mode)
  if argv.empty?
    yield $stdin
  else
    argv.each do |path|
      File.open(path, mode){|f| yield f }
    end
  end
end

argf_imitate(ARGV, 'rb') do |f|
  buffer = StringIO.new(proc_tbl[mode].call(f.read))
  until buffer.eof?
    $stdout.print buffer.read(64)
  end
end
```


---

# 初心者用課題（汎用アルゴリズム編） Ruby版 {#exercise-algo}
問題の詳細については
[練習問題(アルゴリズム編)](/docs/練習問題-アルゴリズム編-)を参照。

# スタック {#stack}

```
require 'readline'
require 'forwardable'

module RPCalc
  class Stack
    extend Forwardable
    
    def initialize
      @body = []
    end

    def self.load(collection)
      stack = self.new
      collection.each{|x| stack.push x }
      stack
    end
    
    def_delegators :@body, :push, :pop, :size, :empty?
    def_delegator :@body, :last, :top
    
    def pretty_print
      ". " + @body.reverse.map{|x| x.to_s }.join(" ") + " ]"
    end
  end
  
  module Lexer
    def lex(str)
      str.strip.split(/\s+/)
    end
  end

  module Parser
    def parse(tokens)
      semantic_values = []
      tokens.each do |token|
        case token
        when /\A[_a-zA-Z]\w*\Z/
          semantic_values.push [token.intern, :IDENT]
        when /\A\d+\.\d+\Z/, /\A\d+\Z/
          semantic_values.push [token.to_f, :NUMBER]
        when /\A(\+|-|\*|\/)\Z/
          semantic_values.push [token.intern, :COPERATOR]
        else
          semantic_values.push [token.intern, :ETC]
        end
      end
      semantic_values
    end
  end
  
  module Evaluater
    def evaluate(svals, stack)
      svals.each do |value, type|
        case type
        when :COPERATOR
          unless o2 = stack.pop
            warn "Stack Empty."
            break
          end
          unless o1 = stack.pop
            warn "Stack Empty."
            stack.push o2
            break
          end
          stack.push o1.__send__(value, o2)
        when :NUMBER
          stack.push value
        when :IDENT
          exit if value == :exit
        when :ETC
          ; #ignore
        else
          raise Exception, "unknown semantic value: #{type}"
        end
      end
      stack.top
    end
  end
  
  class Calculator
    include Lexer, Parser, Evaluater
    
    def initialize
      @stack = Stack.new
    end
    
    def shell(prompt, echo=true)
      while line = Readline.readline(prompt, true)
        yield line
        puts @stack.pretty_print if echo
      end
    end
    
    def calculate(expr)
      tokens = lex(expr)
      svals = parse(tokens)
      evaluate(svals, @stack)
    end
  end
end


calc = RPCalc::Calculator.new
calc.shell("> ") do |line|
  puts calc.calculate(line)
end
print "\n"
```
