# 
# shiritori.rb
# 
# ver.3 2007/05/15
# BSD licensed
# 
# for プログラミングスレまとめ in VIP

#!ruby -Ks

module Rands
module_function
  def bool_rand
    rand(2).zero?
  end
  
  def array_rand(array)
    array[rand(array.size)]
  end
  
  def char_rand
    (rand(?z - ?a) + ?a).chr
  end
end


class GameMaster
  def initialize
    @dictionary = []
    @players = []
    @answer_log = []  #assoc list ... [word, player_id]
    @before = nil
  end
  
  def log_search(word)  #[nth, id]
    ret = nil
    @answer_log.each_with_index do |x, i|
      if x[0] == word
        ret = [i+1, x[1]]
        break
      end
    end
    ret
  end
  
  def log_size
    @answer_log.size
  end
  
  def dictionary_load(f)
    f.each do |line|
      line.strip!
      @dictionary.push line.downcase if /\A\w+\Z/ =~ line
    end
  end
  
  def entry(pl)
    pl.dictionary = @dictionary
    pl.game_master = self
    @players.push pl
  end
  
  def now
    @pl
  end
  
  def succ
    turn_player do |pl|
      wd = pl.answer(@before)
      if wd
        @answer_log.push [wd, pl.id]
        @before = wd
      end
    end
  end
  
  def each
    loop do
      break unless (ret = succ)
      yield ret
    end
  end
  
  def twice?(word)
    @answer_log.assoc(word) ? true : false
  end
  
private
  def turn_player
    ret = nil
    @pl = @players.shift
    ret = yield(@pl)
    @players.push @pl
    ret
  end
end


class Player
  def initialize(id, dictionary=[], gm=nil)
    @id = id
    @dictionary = dictionary
    @gm = gm
  end
  
  def game_master=(gm)
    @gm = gm
  end
  
  attr_reader :id
  attr_accessor :dictionary
end


class ManualPlayer < Player
  include Rands
  
  def answer(before)
    before = char_rand unless before
    @wd = read_answer(before,
                      "[#{before[-1, 1]}...] > ",
                      "エラー: もう一度入力してください")
    @gm.twice?(@wd) ? nil : @wd
  end
  
  def before_input
    @wd
  end
  
private
  def read_answer(before, prompt, err_msg)
    line = nil
    loop do
      $stderr.print prompt
      line = $stdin.gets or raise Interrupt
      line.strip!
      break if /\A#{before[-1, 1]}\w*/ =~ line && @dictionary.include?(line)
      $stderr.puts err_msg
    end
    line
  end
end


class AutoPlayer < Player
  include Rands
  
  def answer(before)
    if before
      while wd = think_answer(before)
        if @gm.twice? wd
          @dictionary.delete_if{|x| x == wd}
        else
          break
        end
      end
      wd
    else
      array_rand(@dictionary)
    end
  end
  
private
  def think_answer(before)
    @dictionary.detect{|x| /\A#{before[-1, 1]}\w*/ === x}
  end
end



###
USAGE = "ruby shiritori.rb DICT_FILE"

begin
  raise "辞書ファイルが指定されていません" if ARGV.empty?
  gm = GameMaster.new
  gm.dictionary_load ARGF
  
  pls = [ManualPlayer.new("あなた"), AutoPlayer.new("わたし")]
  pls.reverse! if Rands.bool_rand
  pls.each{|x| gm.entry x}
  
  word = nil
  gm.each do |word|
    $stderr.puts "#{gm.now.id}の回答 ... #{word}"
  end
  
  if gm.now.id == "あなた"  #now.id ... Looser
    log = gm.log_search(gm.now.before_input)
    $stderr.print "「その言葉は #{log[0]} 回目に #{log[1]} が使用しています。"
    $stderr.puts "わたしの勝ちです。"
  else
    $stderr.puts "「まいりました！あなたの勝ちです。"
  end
  $stderr.puts "　今回のしりとりでは #{gm.log_size} 個の単語を使用しました。」"
  
rescue RuntimeError => ex
  $stderr.puts "Error: #{ex.message}"
  $stderr.puts "Usage: #{USAGE}"
  exit(1)
end
