---
title: "Ruby"
date: 2026-10-21T06:47:08+09:00
lastmod: 2026-10-21T06:47:08+09:00
slug: "Ruby"
draft: false
---

[練習問題(アルゴリズム編)](/docs/練習問題-アルゴリズム編-)

例外処理がないです。


```
=begin
ruby main.rb 1 2 + 4 5 + \*
> 27
ruby main.rb 1 2 + 3 \* 4 5 / -
> 8.2
ruby main.rb 5 13 + 6 / 2 % 4 5 \* -
> -19
=end
st = []
ARGV.each { |e|
  if e=='+'
    b, a = st.pop, st.pop
    st.push(a+b)
  elsif e=='-'
    b, a = st.pop, st.pop
    st.push(a-b)
  elsif e=='*'
    b, a = st.pop, st.pop
    st.push(a*b)
  elsif e=='/'
    b, a = st.pop, st.pop
    st.push(a%b==0 ? a/b : a*1.0/b)
  elsif e=='%'
    b, a = st.pop, st.pop
    st.push(a%b)
  else
    st.push(e.to_i)
  end
}
p st.pop
```
