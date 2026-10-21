# Contribution Guide

このウェブサイトへのコントリビュート方法についてのガイドです。

## Hugo

このウェブサイトは [Hugo](https://gohugo.io/) で作成されています。<br />
また、文章は Markdown で書かれています。Markdown の記法については、[Learn Markdown](https://gohugo.io/content-management/formats/#learn-markdown) を参照してください。

## Pull Request

Pull Request はいつでも歓迎しています。

**受け入れる Pull Request**

次の種類の Pull Request を受け付けています。<br />
基本的な Pull Request（特に細かいもの）は、Issue を立てずに Pull Request を送ってもらって問題ありません。

「このような修正/改善はどうでしょう？」という疑問がある場合は、Issue を立てて相談してください。

- 誤字/脱字/スペルの修正
- 別の説明方法の提案や修正
- 文章をわかりやすくするように改善

:memo: **Note:** Pull Request を受け入れるとあなたの貢献が [Contributorsリスト](https://github.com/massy22/vipprog-wiki/graphs/contributors) に追加されます。<br />
これは、あなたの貢献がこのウェブサイトへの努力的な寄付となることを意味しています。

## 修正の送り方

文章の誤字の修正程度なら、直接 GitHub 上で編集して Pull Request を送ってください。

- [リポジトリのファイルを編集する](https://docs.github.com/ja/repositories/working-with-files/managing-files/editing-files#editing-files-in-your-repository)

ローカルで編集して送りたい場合は次の手順を試してください。

1. Fork する
2. Branch を作る: `git checkout -b my-new-feature`
3. 修正を確認する: 次項参照
4. 変更をコミットする: `git commit -am 'add some feature'`
5. Push する: `git push origin my-new-feature`
6. Pull Request を送る :D

## 修正の確認方法

このウェブサイトは [Hugo](https://gohugo.io/) で作成されています。<br />
`hugo server` を実行後、[http://localhost:1313/wiki/](http://localhost:1313/wiki/) へアクセスすることで、ウェブサイトのプレビュー表示ができます。<br />
hugo のインストール方法については、[Installation](https://gohugo.io/installation/) を参照してください。

```
hugo server
# open http://localhost:1313/wiki/
```

## ディレクトリ構造

`content/docs` 下にページ毎にディレクトリを切り、<br />
その下に markdown(`_index.md`)、添付リソース(`sample.png`) などを配置して扱います。
