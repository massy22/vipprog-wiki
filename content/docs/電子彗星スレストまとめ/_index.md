---
title: "電子彗星スレストまとめ"
date: 2026-07-13T04:06:26+09:00
lastmod: 2026-07-13T04:06:26+09:00
slug: "電子彗星スレストまとめ"
draft: false
---

プログラムを作ってその収入で生活したいのですが・・・・
[yutori7.2ch.net/test/read.cgi/news4vip/1275158892/612-](https://kako.5ch.io/test/read.cgi/news4vip/1275158892/612-n) にて。

<span style="color:red;">612 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 17:57:13.43 ID:WYfxtrDR0</span>

```
これの意味わかりますか 
 
再生工作方法 
 
javascript: 
document.cookie="nicohistory=;path=/;domain=nicovideo.jp;"; 
ml='watch/'+Video.v;sl='api/getflv/'+(Video.v+'\x3f').replace(/nm.*/,"$&as3=1&")+'ts='+(new Date()-7999); 
sb=function(ul){new Ajax.Request(ul,{method:'get'})}; 
me=function(ul,ue){new Ajax.Request(ul,{method:'get',onSuccess:function(h){sb(ue)}})}; 
me(ml,sl); 
void(0); 
 
これを参考に 
 
・nicovideo.jp/watch/*にアクセス 
・垢を変えてnicovideo.jp/api/getflv/*を叩くようにする 
```


<span style="color:blue;">613 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:02:13.85 ID:06MT4ZCpP</span>

```
>>612 
ただのJavaScript。ごちゃごちゃしてて見づらいけど単にCookieに値セットして、 
何かAjaxソースライブラリ（XMLHttpRequest使った送信など）をしてるだけの様子 
 
```


<span style="color:red;">614 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:03:49.74 ID:WYfxtrDR0</span>

```
？ 
```


<span style="color:blue;">615 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:10:17.02 ID:06MT4ZCpP</span>

```
見やすく書き直すとこうじゃね 
 
document.cookie = "nicohistory=;path=/;domain=nicovideo.jp;"; 
 
function me_func(ul, ue) { 
　new Ajax.Request(ul, { 
　　method:'get', 
　　　onSuccess:function(h) { 
　　　　new Ajax.Request(ue, { method:'get' }); 
　　　} 
　}); 
} 
 
me_func( 
　'watch/' + Video.v, 
　'api/getflv/' + (Video.v + '\x3f').replace(/nm.*/, "$&as3=1&") + 'ts=' + (new Date()-7999) 
); 
 
>>614 
何？ 
```


<span style="color:red;">616 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:13:16.40 ID:WYfxtrDR0</span>

```
わからない。 
```


<span style="color:blue;">617 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:14:33.78 ID:06MT4ZCpP</span>

```
何がわからないかわからない。プログラム的な話じゃないの？ 
それとも、「これを参考に」 の下の2行を実行するにはどうしたらいいかって話なの？ 
 
```


<span style="color:red;">618 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:15:11.89 ID:WYfxtrDR0</span>

```
全てが分からない。 
 
get送信と何か関係ありますか？ 
```


<span style="color:blue;">619 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:16:24.38 ID:KYUkJbDPP</span>

```
>>618 
JavaScriptを使ってGETしてる 
```


<span style="color:blue;">620 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:17:21.06 ID:06MT4ZCpP</span>

```
>>618 
HTTPの勉強からしろ。単にHTTP-GETと関係ありますか？って話ならあるだろ。 
てか全てがわからないって言うか、何をしたくて何で詰まって、何を知りたい質問なの？ 
```


<span style="color:red;">621 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:17:26.98 ID:WYfxtrDR0</span>

```
ここまで理解 
```


<span style="color:blue;">622 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:18:10.43 ID:KYUkJbDPP</span>

```
ひょっとして・・・BOTじゃね？ 
```


<span style="color:red;">623 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:18:38.47 ID:WYfxtrDR0</span>

```
>>620 
再生工作がしたくて>>612で何をどうすれば分からないで詰まる話 
```


<span style="color:blue;">624 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:20:13.29 ID:06MT4ZCpP</span>

```
>>623 
くだらね。どうしてもやりたかったら普通に勉強しろ 
HTTPの意味や流れと、さしあたりJavaScriptならJavaScriptの勉強しとけ 
```


<span style="color:red;">625 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:21:25.47 ID:WYfxtrDR0</span>

```
？ 
```


<span style="color:blue;">626 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:22:36.61 ID:onueNKSV0</span>

```
再生工作方法が提示されてて再生工作方法がわからないって意味がわからないんだが 
```


<span style="color:red;">627 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:23:23.79 ID:WYfxtrDR0</span>

```
オレだって意味分からないちんぷんかんぷん 
```


<span style="color:blue;">628 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:23:47.85 ID:06MT4ZCpP</span>

```
？だけで返されるとムカつくんだけど、そもそもコーディング出来る人なの？普通に何か書けるの？ 
何にも知らないただのニコ厨なの？ 
上にあった内容は多分単純にアカウント切り替えて、動画再生をする手間を減らすだけのコードだと思うぞ 
ブラウザ上でいちいちやらずとも、っていうだけの物。もうスルーする 
```


<span style="color:red;">629 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:25:10.29 ID:WYfxtrDR0</span>

```
ただの一般人。 
 
ってことは上の変なの使わなくてもいい訳ね。 
```


<span style="color:blue;">630 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:25:42.29 ID:onueNKSV0</span>

```
自分で意味がわかってない質問ならするなよ 
```


<span style="color:red;">631 名前：<strong> </strong>[―{</span>@{}@{}-]<strong> 以下、名無しにかわりましてVIPがお送りします</strong>[sage] 投稿日：2010/06/02(水) 18:30:02.15 ID:959fITpYP BE:919583055-S★(558068)};

```
sssp://img.2ch.net/ico/nagato.gif 
!vip2:stop:
--- 
真の勇者のさすがの攻撃  
MP263使ってへっぽこの呪文を唱えた。★ミ （スレのダメージ 0）  
このスレは1回目のダメージを受けた (150/1000) 
ぼうそうがはじまった!! さらにこのスレは2回目のダメージを受けた (300/1000) 
追加攻撃!! さらにこのスレは3回目のダメージを受けた (320/1000) 

```


<span style="color:blue;">632 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:32:16.18 ID:06MT4ZCpP</span>

```
こういうくだらないネタだと脊髄反射スレストでも文句出ない 
```


<span style="color:red;">633 名前：<strong>電子彗星 </strong>◆Ankoku.EZY [sage] 投稿日：2010/06/02(水) 18:34:01.18 ID:AQiEB/+mP BE:2473591695-PLT(12000) 株優プチ(charaneta2)</span>

```
sssp://img.2ch.net/ico/u_hoshi.gif 
!vip2:stop:
--- 
まほうつかいたんのつよめの攻撃  
MP266使ってへっぽこの呪文を唱えた。★ミ （スレのダメージ 320）  
このスレは4回目のダメージを受けた (470/1000) 
ぼうそうがはじまった!! さらにこのスレは5回目のダメージを受けた (620/1000) 
追加攻撃!! さらにこのスレは6回目のダメージを受けた (630/1000) 

```


<span style="color:red;">634 名前：<strong>電子彗星 </strong>◆Ankoku.EZY [sage] 投稿日：2010/06/02(水) 18:34:06.30 ID:WYfxtrDR0 BE:1500848055-PLT(31500) 株主優待</span>

```
sssp://img.2ch.net/ico/u_mosa.gif 
文句はvip警察まで。 
 
!vip2:stop:
--- 
まほうつかいたんのつよめの攻撃  
すかった２。 

```


<span style="color:blue;">635 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:36:40.19 ID:onueNKSV0</span>

```
別に文句言う気などさらさらないが、スレスト理由ｋｗｓｋ 
```


<span style="color:red;">636 名前：<strong> </strong>[―{</span>@{}@{}-]<strong> 電子彗星 </strong>◆Ankoku.EZY [sage] 投稿日：2010/06/02(水) 18:37:15.37 ID:ctyomaVxP BE:2401356858-PLT(31500) 株主優待};

```
sssp://img.2ch.net/ico/u_mosa.gif 
運用に文句行ってこい。 
 
!vip2:stop:
--- 
まほうつかいたんのつよめの攻撃  
MP405使ってへっぽこの呪文を唱えた。★ミ （スレのダメージ 630）  
このスレは7回目のダメージを受けた (780/1000) 
こうかは ばつぐんだ!! さらにこのスレは8回目のダメージを受けた (930/1000) 
追加攻撃!! さらにこのスレは9回目のダメージを受けた (940/1000) 

```


<span style="color:blue;">637 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:37:49.30 ID:KYUkJbDPP</span>

```
また「パートスレ立てんな」とかじゃね？以前のローカルルールに関する議論で「パートスレ禁止」は無しになったのによくやるわ 
```


<span style="color:blue;">638 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:38:00.20 ID:06MT4ZCpP</span>

```
>>634 
てめえ 
```


<span style="color:blue;">639 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:38:27.69 ID:1vB9am6hO</span>

```
なんの容疑すかｗｗｗｗｗｗｗ 
```


<span style="color:blue;">640 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:39:02.22 ID:06MT4ZCpP</span>

```
ID:WYfxtrDR0 自分で話ふっといてスレストだとこの野郎 
悪意しかねぇじゃねーか 
```


<span style="color:blue;">641 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:39:35.82 ID:KYUkJbDPP</span>

```
なんださっきの質問してた奴か。逆恨みもいいところだな 
```


<span style="color:red;">642 名前：<strong>電子彗星 </strong>◆Ankoku.EZY [sage] 投稿日：2010/06/02(水) 18:41:01.46 ID:8qhE4gMUP BE:1350965838-2BP(587)</span>

```
sssp://img.2ch.net/ico/u_tobacco.gif 
出会いスレだからスレスト対象です。さようなら。 
 
vip警察でまた会おう！ 
 
!vip2:stop:
--- 
見習い戦士のふつうの攻撃 
すかった２。 

```


<span style="color:blue;">643 名前：<strong>以下、名無しにかわりましてVIPがお送りします</strong>[] 投稿日：2010/06/02(水) 18:41:45.50 ID:KYUkJbDPP</span>

```
だれかコイツの一連のレスVIP警察にコピペしてやれよ。面白そうだ 
```


<span style="color:red;">644 名前：<strong>電子彗星 </strong>◆Ankoku.EZY [sage] 投稿日：2010/06/02(水) 18:42:01.85 ID:8qhE4gMUP BE:1970157757-2BP(587)</span>

```
sssp://img.2ch.net/ico/u_tobacco.gif 
もうやだｇｄｇｄですねｗ 
 
!vip2:stop:
--- 
見習い戦士のふつうの攻撃 
MP424使ってへっぽこの呪文を唱えた。★ミ （スレのダメージ 940）  
このスレは10回目のダメージを受けた (1090/1000) 
ぼうそうがはじまった!! さらにこのスレは11回目のダメージを受けた (1240/1000) 
このスレは・・・ 
 
停止しました。
```
