---
title: "成果物"
date: 2026-07-13T14:02:28+09:00
lastmod: 2026-07-13T14:02:28+09:00
slug: "成果物"
draft: false
---

スレ産の成果物を転がしておく場所です。


<br />
# 保守スクリプト {#gdf4fd23}
たぶんPerl5.8+必須。ソースはUTF-8で保存すること。ライセンスはパブリックドメイン相当でおk


```
#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use LWP;
use LWP::Debug qw(+);
use HTTP::Date;
use HTTP::Status;
use Encode;

our $VERSION = '0.01';
my $ua = LWP::UserAgent->new(
    agent => "Monazilla/1.00 hoshu-bot.pl/$VERSION",
    cookie_jar => {},
);

sub sjis { encode('cp932', $_[0]) }

sub write_something {
    my ($host, $board_key, $thread_key) = @_;
    my $name = '';
    my $mail = '';
    my $message = 'ほしゅ';
    
    REQ:
    my $res = $ua->post("http://$host/test/bbs.cgi",
        [ bbs => $board_key, key => $thread_key,
          FROM => sjis($name), mail => sjis($mail), MESSAGE => sjis($message),
          submit => sjis('書き込む'), time => 1, hana => 'mogera' ],
        Referer => "http://$host/$board_key/");

    for (decode('cp932', $res->content)) {
        if (/書きこみました/ || /2ch_X:true/) { print {*STDERR} "OK! :-)\n"; }
        elsif (/2ch_X:false/)                 { print {*STDERR} "maybe OK?\n"; }
        elsif (/書き込み確認/ || /2ch_X:cookie/) {
            print {*STDERR} "Cookie needed; retry\n"; goto REQ;
        } else {
            print {*STDERR} "ERROR!\n"; exit 1;
        }
    }
}

if ($0 eq __FILE__) {
    my $thread_url = $ARGV[0];
    my ($host, $board_key, $thread_key) =
        $thread_url =~ m{http://([\w.]+)/test/read\.cgi/(\w+)/(\d+)/};
    die "Usage: $0 <thread_url>"
        unless 3 == grep {defined} ($host, $board_key, $thread_key);
    
    my $interval = 60 * 15;
    my $last_modified = 0;
    
    while (1) {
        my $res = $ua->head(
            "http://${host}/${board_key}/dat/${thread_key}.dat",
            'If-Modified-Since' => time2str($last_modified));
        if ($res->code == RC_NOT_MODIFIED) {
            write_something($host, $board_key, $thread_key);
            redo;
        }
        elsif ($res->code == RC_OK) {
            $last_modified = str2time($res->header('Last-Modified'));
            my $now = str2time($res->header('Date'));
            my $wait = $last_modified + $interval - $now;
            sleep($wait > 0 ? $wait : 1);
        }
        else {
            die 'error!';
        }
    }
}
```


# Write2ch(C) {#k275b774}
ライセンスは不明。
<del>http://www8.uploader.jp/dl/vipprog/vipprog_uljp00252.zip.html </del>(消失)

# write2ch(ShellScript) {#j784b885}
[vipprog_uljp00254.txt](https://web.archive.org/web/200804id_/www8.uploader.jp:80/user/vipprog/images/vipprog_uljp00254.txt)

```bash
#!/bin/sh
#ヤター シェルスクリプトでwrite2chできたよー＼(^o^)／
#License: どーでもいーよー　らいせんす
version="0.10"
usage="
Usage: write2ch.sh [-h] [--help] [-n name] [--name=NAME]
         [-m MAIL] [--mail=MAIL] [--version] URL MESSAGE"
 
while test $# -gt 0; do
  case "$1" in
  -h | --help | --h*)
    echo "$usage"; exit 0 ;;
  --name=* | --n*=* )
    name=`echo \"${1}\" | sed -e 's/^[^=]*=//'`
    shift ;;
  -n | --name | --n*)
    shift
    test $# -eq 0 && { echo "$usage" 1>&2; exit 1; }
    name="$1"
    shift ;;
  --mail=* | --m*=* )
    mail=`echo \"$1\" | sed -e 's/^[^=]*=//'`
    shift ;;
  -m | --m*)
    shift
    test $# -eq 0 && { echo "$usage" 1>&2; exit 1; }
    mail="$1"
    shift ;;
  -v | --version | --v*)
    show_version=1; shift ;;
  --)
    shift; break ;;
  -*) echo "$usage" 1>&2; exit 1 ;;
  *)
    if [ -z $url ]; then
      url="$1"
    elif [ -z $message ]; then
      message="$1"
    fi
    shift ;;
  esac
done
 
 
if test $show_version; then
  echo "write2ch.sh version $version"; exit 0
fi
 
if [ -z "$url" -o -z "$message" ]; then
  echo "$usage" 1>&2; exit 1
fi
 
name=`echo $name|nkf -s`
mail=`echo $mail|nkf -s`
message=`echo $message|nkf -s`
 
tmp=`echo $url | sed -e 's/\(http:\/\/[^\/]*\)\/test\/read\.cgi\/\([^\/]*\)\/\([^\/]*\).*/\1 \2 \3/'`
host=`echo $tmp | cut -d " " -f 1`
bbs=`echo $tmp | cut -d " " -f 2`
key=`echo $tmp | cut -d " " -f 3`
data="bbs=$bbs&key=$key&FROM=$name&mail=$mail&time=1&MESSAGE=$message"
submit=`echo "書き込む" | nkf -s`
cookie=`wget -q --save-headers --header="Cookie:NAME=\"$name\"; MAIL=\"$mail\";" --referer=$url --post-data="${data}&submit=$submit" -O - $host/test/bbs.cgi | grep Set-Cookie`
cookie=`echo $cookie | sed -e "s/Set-Cookie://"`
submit=`echo "上記全てを承諾して書き込む" | nkf -s`
wget -q --header="Cookie:NAME='$name'; MAIL='$mail';$cookie" --referer=$host/test/bbs.cgi --post-data="${data}&submit=$submit&hana=mogera" -O - $host/test/bbs.cgi > /dev/null
```


# write2ch(Ruby) {#o203c68f}

```ruby
#! /usr/bin/ruby1.9
# -*- coding: utf-8 -*-
require 'net/http'
require 'hpricot'
require 'nkf'
class Write2ch
  Net::HTTP.version_1_2
  Encoding = "Windows-31J"
  UrlRegex = /http:\/\/(.+?)\/test\/read\.cgi\/(.+?)\/(\d{10})\//
  def initialize(url, cookie, message, name="", mail="sage", user_agent="Mozilla/4.0")
    @host, @bbs, @key = url.scan(UrlRegex).flatten
    @ref        = "http://#{@host}/test/bbs.cgi?guid=ON"
    @subback    = "http://#{@host}/#{@bbs}/subback.html"
    @message    = message.encode(Encoding)
    @from       = name.encode(Encoding)
    @mail       = mail.encode(Encoding)
    @cookie     = cookie
    @user_agent = user_agent
  end
  attr_accessor :message, :name, :mail, :user_agent
  def write(message)
    Net::HTTP.start(@host, 80) {|my_http|
      @message = message if message != nil
      query  = "&bbs=#{@bbs}&key=#{@key}&mail=#{@mail}&FROM=#{@from}&MESSAGE=#{@message}&time=1&hana=mogera&den=bo"
      header = {"Host"=>@host, "Cookie"=>@cookie, "Referer"=>@ref, "User-Agent"=>@user_agent}
      res, body = my_http.post("/test/bbs.cgi?guid=ON", query, header)
        raise body if res.code != "200"
      title_u = Hpricot(body).search("title").innerHTML.to_s.encode("UTF-8", Encoding).gsub(/\r/,"")
        raise body if title_u != "書きこみました。"
    }# Net::HTTP end
  end
end
```


```ruby
# ----- 使い方 -----
# set your cookie
pon = "PON=your.host.ne.jp;"
hap = "PREN=...;HAP=FOXdayo...;";
url = "http://hibari.2ch.net/test/read.cgi/news4vip/1310738793/"

writer = Write2ch.new(url, pon+hap, "テスト")
writer.write()
writer.write("てすと")
```


<br />
# PHP製保守スクリプト {#a5fdb8ba}
ライセンスはパブリックドメイン。

文字コードはUTF-8で保存すること。ライブラリと本体に分かれてますｗｗｗ

以下ライブラリ

```
<?php
// function http_request($url, $param = null, $mode = "GET", $refere = "", $iscookie = false)
function http_request($url, $param = null, $mode = "GET", $prmhdrs = null, $iscookie = false)
{
    global $usragent;
    global $cookies;
    
    $hdrstr = "";
    $cookiestr = "";
    if($iscookie == true)
    {
        if(isset($cookies) == false)
        {
            $cookies = array();
        }
    }
    
    $pathinfo = parse_url($url);
    $host = $pathinfo["host"];
    $path = $pathinfo["path"];
    if(isset($pathinfo["query"]))
    {
        $query = "?";
        $query .= $pathinfo["query"];
    }
    else
    {
        $query = "";
    }
    $path .= $query;    
    $port = "80";
    
    $fp = fsockopen ($host, 80, $errno, $errstr, 30);
    $buff = "";
    
    if(!$fp) {
        return false;
    }
    
//     $Referer = "";
//     if($refere != "")
//     {
//         $Referer = "Referer: {$refere}\r\n";
//     }
    
    socket_set_timeout($fp, 2);

    if((isset($cookies[$host]) == true) && ($iscookie == true))
    {
        if(is_array($cookies[$host]) == true)
        {
            reset($cookies[$host]);
            $cookiestr .= "Cookie: ";
            $delimiter = "";
            
            while($val = each($cookies[$host]))
            {
                $cookiestr .= $delimiter;
                $cookiestr .= $val['key'];
                $cookiestr .= "=";
                $cookiestr .= $val['value'];
                $delimiter ="; ";
            } 

            $cookiestr .= "\r\n";
        }
    }
    
    if(isset($prmhdrs))
    {
        if(is_array($prmhdrs))
        {
            
            reset($prmhdrs);
            
            while($val = each($prmhdrs))
            {
                $hdrstr .= $val['key'];
                $hdrstr .= ": ";
                $hdrstr .= $val['value'];
                $hdrstr .= "\r\n";
            }
        }
    }
    
    if($mode == "GET") {
        $header = "";
        $header.= "GET {$path} HTTP/1.1\r\n";
        $header.= "Host: {$host}\r\n";
        $header .= $cookiestr;
//         $header .= $Referer;
        $header .= $hdrstr;
        $header .= "User-Agent: {$usragent}\r\n";
        $header .= "Connection: close\r\n";
        $header.= "\r\n";
        
    } else if($mode == "POST") {        
        if(!is_array($param)) {
            return false;
        }
        $prmstr = "";
        $prmdlim = "";

        $header = "";
        reset($param);
        
        while($val = each($param))
        {
            $prmstr .= $prmdlim;
            $prmstr .= $val['key'];
            $prmstr .= "=";
            $prmstr .= rawurlencode($val['value']);
            $prmdlim = "&";
        }

        $length  = strlen($prmstr);
        $header .= "POST {$path} HTTP/1.1\r\n";
        $header .= "Host: {$host}\r\n";
        $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
        $header .= "Content-Length: {$length}\r\n";
        $header .= $cookiestr;            
    
//         $header .= $Referer;
        $header .= $hdrstr;
        $header .= "User-Agent: {$usragent}\r\n";
        $header .= "Connection: close\r\n";
        $header .= "\r\n";
        $header .= "{$prmstr}\r\n";
    } else if($mode == "HEAD") {
        $header = "";
        $header.= "HEAD {$path} HTTP/1.1\r\n";
        $header.= "Host: {$host}\r\n";
        $header .= $cookiestr;
        $header .= $hdrstr;
        $header .= "User-Agent: {$usragent}\r\n";
        $header .= "Connection: close\r\n";
        $header.= "\r\n";
    } else {
        return false;
    }
    
    fwrite($fp, $header);
    
    while(!feof($fp)) {
          fputs ($fp, $header);
        $buff .= fgets($fp, 128);
    }

    parse_httpresponse($buff, $reshdr, $resbody);
    $reshdrs = explode("\r\n", $reshdr);
    
    $result = array();
    foreach($reshdrs as $hdrval)
    {
//         if(preg_match('/^Set-Cookie: ([^=]+)=(.*)$/', $hdrval, $match))
        if(preg_match('/^Set-Cookie: ([^=]+)=([^;]*)/', $hdrval, $match))
        {
            if($iscookie == true)
            {
                if(isset($cookies[$host]) == false)
                {
                    $cookies[$host] = array();
                }
                $cookies[$host][$match[1]] = $match[2];
            }
        }
        else if(preg_match('/^HTTP\/1\.[0-1x] (.*)$/', $hdrval, $match))
        {
            $result["status"] = $match[1];
        }
        else if(preg_match('/^([^:]+): (.*)$/', $hdrval, $match))
        {
            if(isset($result["header"]) == false)
            {
                $result["header"] = array();
            }
            
            $result["header"][$match[1]] = $match[2];
        }
    }
    $result["body"] = $resbody;

    return $result;        
}

function parse_httpresponse($responsetxt, &$header, &$body)
{
    $hdrend = strpos($responsetxt, "\r\n\r\n");
    
    if($hdrend === false) {
        return false;
    }
    $header = substr($responsetxt, 0, $hdrend);
    
    $bodystart = $hdrend + 4;
    $body = substr($responsetxt, $bodystart);
    
    return true;
}
?>

```

<br />
本体。

```
#!/usr/bin/php
<?php
    require_once('httplib.php');
    
    if($argc < 1)
    {
        echo "{$argv[0]} <thred url>";
        echo "param err!!";
        return ;
    }

    preg_match('/http:\/\/([^\/]+)\/.+\/read\.cgi\/([^\/]+)\/([0-9]+)\//', $argv[1], $match);
//    preg_match('/http:\/\/(.+)\/read\.cgi\/([^\/]+)\/([0-9]+)\//', $argv[1], $match);

    if(is_array($match) == false)
    {
        echo "param err!!";
        return;
    }
    $cookies = array();
//    $usragent = "Monazilla/1.00 Live2ch/1.17";
    $usragent = "Monazilla/1.00";
    $posturl = "http://{$match[1]}/test/bbs.cgi?guid=ON";
    
    $headurl = "http://{$match[1]}/{$match[2]}/dat/{$match[3]}.dat";
    $last_modified = 0;
    $reloadhdr = array();
    $reloadhdr['If-Modified-Since'] = $last_modified;
    
    $headers = array();
    $headers['Referer'] = "http://{$match[1]}/{$match[2]}/";
    
    $bbs = $match[2];
    $key = $match[3];

    $FROM = "";
    $mail = mb_convert_encoding('age', "SJIS", "UTF-8");
    $MESSAGE = 'test';
        
    $postprm = array();
    
    $interval = 30 * 60;
    
    $postprm['bbs'] = $bbs;
    $postprm['key'] = $key;
    $postprm['FROM'] = $FROM;
    $postprm['mail'] = $mail;
    $postprm['MESSAGE'] = $MESSAGE;
//    $postprm['MIRV'] = 'kakkoii';
    
    $postprm['submit'] = mb_convert_encoding("書き込む", "SJIS", "UTF-8");
    $postprm['time'] = "1";
//    $postprm['hana'] = "mogera";
    $postprm['suka'] = "pontan";

    function postto2ch($posturl, $postprm, $headers)
    {
        $result = http_request($posturl, $postprm, "POST", $headers, true);

        if($result === false) {
            echo "not response!!\n";
            return false;
        }
        
        $body = mb_convert_encoding($result["body"], "UTF-8", "SJIS");
        
        if(preg_match('/書きこみ＆クッキー確認/um', $body))
        {
            echo "need cookie!!\n";
            
            $postprm['submit'] = mb_convert_encoding("上記全てを承諾して書き込む", "SJIS", "UTF-8");
            $headers['Referer'] = $posturl;
                        
            $result = http_request($posturl, $postprm, "POST", $headers, true);

            if($result === false)
            {
                echo "no response!!\n";
                return false;
            }
            
            $body = mb_convert_encoding($result["body"], "UTF-8", "SJIS");
            
            if((preg_match('/書きこみ.*ました/um', $body)) || 
                (preg_match('/^303/', $result["status"])) )
            {
            
                return true;
            }
            else
            {
                echo "err!\n";
                return false;
            }
        } 
        else if((preg_match('/書きこみ.*ました/um', $body)) || 
            (preg_match('/^303/', $result["status"])) )
        {
            return true;
        }
        else
        {
            echo "err!\n";
            return false;
        }
        return false;
    }
        
    while(1)
    {
        $reloadhdr['If-Modified-Since'] = gmstrftime(
            '%a, %d %b %G %T GMT', $last_modified);
        $result = http_request($headurl, null, "GET", $reloadhdr);

        if(preg_match('/^304/', $result["status"]))
        {
            if(postto2ch($posturl, $postprm, $headers) == false)
            {
                return;
            }
            
            $last_modified = strtotime($result['header']['Date']);
        }
        else if(preg_match('/^200/', $result["status"]))
        {
            $last_modified = strtotime($result['header']['Last-Modified']);
        }
        else
        {
            echo "err!\n";
            return false;
        }
        $now = strtotime($result['header']['Date']);
        $wait = $last_modified + $interval - $now;
    
        if($wait > 0)
        {
            sleep($wait);
        }
        else
        {
            sleep(1);
        }
    }
?>
```


<br />
# Python 製保守スクリプト {#m2049654}
上記の Perl のスクリプト を参考にさせていただきました

```
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# str.format を使うため version は 2.6 以上必要
from urllib import urlencode
from cookielib import CookieJar
import re
import urllib2

class Error(Exception):
    pass
class Write2chException(Error):
    pass

UA = 'Monazilla/1.00 hoshu-bot.py/0.01'
opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(CookieJar()))
opener.addheaders = [('User-Agent', UA)]

def getabouturl(url):
    return re.search(r'http://([\w.]+)/test/read[.]cgi/(\w+)/(\d+)/', url).groups()

def write(url, message, name='', mail='sage'):
    host, board_key, thread_key = getabouturl(url)
    postto   = 'http://{host}/test/bbs.cgi'.format(host=host)
    postdata = dict(
        bbs     = board_key,
        key     = thread_key,
        FROM    = name.encode('sjis'),
        mail    = mail,
        MESSAGE = message.encode('sjis'),
        submit  = u'書き込む'.encode('sjis'),
        time    = 1,
        tepo    = 'don',
    )
    params = urlencode(postdata)

    request = urllib2.Request(postto, params, {'Referer': url})

    while True:
        reader = opener.open(request)
        cont   = unicode(reader.read(), 'sjis')
        if u'書きこみました' in cont or u'2ch_X:true' in cont:
            return
        elif u'2ch_X:false' in cont:
            continue
        elif u'書き込み確認' in cont or u'2ch_X:cookie' in cont:
            continue
        else:
            raise Write2chException(cont)

def main(): 
    import sys
    import time
    import httplib

    url = sys.argv[1]
    mes = u'ほしゅ'

    host, board_key, thread_key = getabouturl(url)
    daturl  = 'http://{host}/{board_key}/dat/{thread_key}.dat'.format(
        host=host, board_key=board_key, thread_key=thread_key)

    lastmod = opener.open(daturl).headers['Last-Modified']
    request = urllib2.Request(daturl)
    request.add_header('If-Modified-Since', lastmod)

    while True:
        try:
            reader  = opener.open(request)
            code    = reader.code
            lastmod = reader.headers['Last-Modified']
            request.add_header('If-Modified-Since', lastmod)
        except urllib2.HTTPError as e:
            code    = e.code
        if code == httplib.OK:
            print 'sleeping...'
            time.sleep(60 * 15)
        elif code == httplib.NOT_MODIFIED:
            write(url, mes)

if __name__ == '__main__':
    main()
```


# write2ch(Perl + WWW::Mechanize) {#i01094c8}
CPANつかってるしArtistic Licenseでおｋ。

```perl
use strict;
use utf8;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
my $serv = 'http://hibari.2ch.net/';
my $url = 'http://hibari.2ch.net/test/read.cgi/news4vip/1321183007/';
my $name = '';
my $mail = 'sage';
my $msg = 'WWW::Mechanizeによる書き込みテストだお；；';

write2ch($mech,$serv,$url,$name,$mail,$msg);

sub write2ch
{
    my ($mech,$serv,$url,$name,$mail,$msg) = @_;
    
    # 対象スレッドを取得
    my $response = $mech->get( $url );
    print $mech->title();

    # WWW::Mechanizeはパス形式でCGIを呼び出すとBaseURIを正しく認識しないので絶対パスに置換
    my $c = $mech->content();
    $c =~ s{\.\./}{$serv}egx;
    $mech->update_html($c);

    # フォームを埋めて書き込み
    my $form = $mech->form_number(1);
    $form->accept_charset('sjis'); # sjisで送信
    $form->find_input("FROM")->value($name);
    $form->find_input("mail")->value($mail);
    $form->find_input("MESSAGE")->value($msg);
    $response = $mech->request($form->click);
    print $mech->title();

    # 初めはクッキーがないのでタイトルで判定して確認
    if($mech->title() eq '■ 書き込み確認 ■')
    {
        $form = $mech->form_number(1);
        $form->accept_charset('sjis'); # sjisで送信
        $response = $mech->request($form->click);
        print $mech->title();
    }
    # 忍法帖が必要なら2分待って再投稿
    if($mech->title() eq 'ＥＲＲＯＲ！')
    {
        if($mech->content() =~ /ninja/)
        {
            print '忍法帖作成待ち　'.localtime(time);
            sleep(121);
            write2ch($mech,$serv,$url,$name,$mail,$msg);
            exit;
        }
    }
    # 終了
    if($mech->title() eq '書きこみました。')
    {
        print "終了。";
    }
    else # なんかエラーみたいですよ。
    {
        print $mech->content();
    }
}
```


# youjo.pl(Perl,Proc::Daemon,WWW::Mechanize) {#pfd6e598}
http://hayabusa.2ch.net/test/read.cgi/news4vip/1373088069/
にて錬成。上記write2chを参考にさせていただきました。


```perl
#!/bin/perl

use strict;
use diagnostics;
use utf8;
use Proc::Daemon;
use WWW::Mechanize;

my $WORK_DIR = "/home/user/youjo";
my $DAEMON;
my $PID_FILE = 'send_daemon.pid';
my $SLEEP_INTERVAL = 60;
my ($action) = @ARGV;

$DAEMON = Proc::Daemon->new(work_dir=> $WORK_DIR,pid_file=> 'send_daemon.pid');
$action ||="";

if ($action eq "start")
{
    my ($pid_path,$pid) = get_pid_file();
    if( -e $pid_path ){
        print "$0 is already running. LOCK_FILE=$pid_path PID=$pid\n";
        exit(1);
    }
    init();
    run();
}
elsif ($action eq "stop")
{
    unless( get_pid_file() ){
        print "$0 is not running\n";
        exit(1);
    }
    open(LOG, ">>/home/user/youjo/log.txt");
    print LOG "" . localtime(time) . "\t" . "Daemon Stop();\n";
    close(LOG);
    del_pid_file();
}
else
{
    print "usage: $0 [start|stop]\n";
}


sub get_pid_file {
    my $pid_file_path = join('/',$WORK_DIR,$PID_FILE);
    return undef if not -e $pid_file_path;
    open(my $fh, $pid_file_path) or die "can't open $pid_file_path :$!";
    my ($line) = <$fh>;
    close $fh or die "can't close $pid_file_path :$!";
    return $pid_file_path;
}
sub del_pid_file {
    my $pid_file_path = join('/',$WORK_DIR,$PID_FILE);
    unlink $pid_file_path or die "can't unlink $pid_file_path :$!";
}
sub interrupt {
    my $sig = shift;
    $SIG{$sig} = 'IGNORE';
    return del_pid_file();
}
sub init {
    Proc::Daemon::Init( {work_dir=> $WORK_DIR,pid_file=> $PID_FILE});
    open(LOG, ">>/home/user/youjo/log.txt");
    print LOG "" . localtime(time) . "\t" . "Daemon Init();\n";
    close(LOG);
    $SIG{INT} = $SIG{HUP} = $SIG{QUIT} = $SIG{KILL} = $SIG{TERM} ='interrupt';
}
sub run {
    while(1) {
        action();
    for(my $i=0;$i<$SLEEP_INTERVAL;$i++)
    {
        my ($pid_path,$pid) = get_pid_file();
        if (not $pid_path ){
            $DAEMON->Kill_Daemon();
            return;
        }
        sleep(1);
    }
    }
}


sub action {
    open(LOG, ">>/home/user/youjo/log.txt");

    my @ita_list;
    my @thread_list;
    my $ita_url;
    my @keyword_list;
    my @target_thread_list;
    my $name = '';
    my $mail = '';
    my $message = 'test';
    my $mech;

    $mech = WWW::Mechanize->new();
    $mech->proxy(['http', 'ftp'], 'http://localhost:3939/');

    getbbsmenu($mech, \@ita_list);
    $ita_url = geturl_regexp( qr/VIP$/, \@ita_list );

    getthreadlist($mech, $ita_url, \@thread_list);

    open(IN, "<:utf8",  "thtitle_keyword_utf8.txt") or die "$!";
    @keyword_list = <IN>;
    close(IN);

    @target_thread_list = getthread_regexp(\@keyword_list, \@thread_list);

    if($#target_thread_list<0)
    {
        print LOG localtime(time) . "\t" . "target not found.\n";
    }
    else
    {
        foreach(@target_thread_list)
        {

            my $idx = rindex(substr($ita_url,0,-1),"/")+1;
            my $url = substr($ita_url, 0, $idx) . "test/read.cgi/" . substr($ita_url, $idx) . substr(${$_}{id},0,-4) . "/";
            if(${$_}{number}>=400)
            {
                write2ch($mech,$ita_url,$url,$name,$mail,$message);
            }else{
                print LOG localtime(time) . "\t" . "□保守不要([" . ${$_}{number} . "]" . $url . ")\n";
            }
        }
    }

    close(LOG);
    return 1;
}


sub getbbsmenu
{
    my ($mech, $ita_list) = @_;
    $mech->get("http://menu.2ch.net/bbsmenu.html");
    push(@$ita_list, $mech->find_all_links(tag => "a", url_regex => qr/.+\.2ch\.net\/.+\//));
}

sub geturl_regexp
{
    my ($r, $ita_list) = @_;
    foreach (@$ita_list)
    {
        if($_->text=~$r)
        {
            return $_->url;
        }
    }
    return "Not Found."
}

sub getthreadlist
{
    my ($mech, $ita_url, $thread_list) = @_;
    $mech->get($ita_url . "subject.txt");
    my @subjects = split(/\n/, $mech->res->decoded_content( charset => 'Shift_JIS' ));
    my $junban = 0;
    foreach (@subjects)
    {
        $junban++;
        $_ =~ s/<>/\t/;
        $_ =~ s/\(([0-9]+)\)/\t$1/;
        my ($tid, $title, $count) = split("\t", $_);
        push(@$thread_list, {id => $tid, title => $title, res_count => $count, number => $junban});
    }
}

sub getthread_regexp
{
    my ($keyword_list, $thread_list) = @_;
    my @result;
    foreach my $t (@$thread_list)
    {
        foreach(@$keyword_list)
        {
            chomp;
            if(${$t}{title}=~/$_/)
            {
                push(@result, $t);
                last;
            }
        }
    }
    return @result;
}

sub write2ch
{
    my ($mech,$serv,$url,$name,$mail,$msg) = @_;
    my $response = $mech->get( $url );
    my $c = $mech->content();
    $c =~ s{\.\./}{$serv}egx;
    $mech->update_html($c);
    my $form = $mech->form_number(1);
    $form->accept_charset('sjis');
    $form->find_input("FROM")->value($name);
    $form->find_input("mail")->value($mail);
    $form->find_input("MESSAGE")->value($msg);
    $response = $mech->request($form->click);
    if($mech->title() eq '■ 書き込み確認 ■')
    {
        print LOG localtime(time) . "\n" . '■ 書き込み確認 ■' . "\n\n" . $mech->res->decoded_content( charset => 'Shift_JIS' ) . "\n\n";
        $form = $mech->form_number(1);
        $form->accept_charset('sjis');
        $response = $mech->request($form->click);
        print $mech->title();
    }
    if($mech->title() eq 'ＥＲＲＯＲ！')
    {
        print LOG localtime(time) . "\n" . 'ＥＲＲＯＲ！' . "\n\n" . $mech->res->decoded_content( charset => 'Shift_JIS' ) . "\n\n";
        if($mech->content() =~ /ninja/)
        {
            sleep(21);
            write2ch($mech,$serv,$url,$name,$mail,$msg);
            exit;
        }
    }
    if($mech->title() ne 'p2 - 書きこみました。')
    {
        print LOG localtime(time) . "\n" . 'ＥＲＲＯＲ！' . "\n\n" . $mech->res->decoded_content( charset => 'Shift_JIS' ) . "\n\n";
        return -1;
    }
    print LOG localtime(time) . "\t" . "■保守完了(" . $url . ")\n";
    return 1;
}
```
