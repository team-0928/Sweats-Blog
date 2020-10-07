# Sweets Blog

Sweets Blogは利用者同士でスイーツの情報を共有することができるサービスです。スイーツの名前や、イメージ、店の住所などを入力して投稿しましょう。誰かがいいね！を付けてくれるかもしれません！今後もサービスの向上を目指してくのでお楽しみに！

現在はアプリの仕組みをより理解してもらうため、サンプルユーザーを登録させています。

## アプリのURL
https://sweets-blog.herokuapp.com/

## アプリの動作環境
- Ruby on Rails(フレームワーク)
- heroku（サーバ）
- AWS/S3(データベース)

動作環境をAWSに移行中です。現在はherokuにて動作中です。
移行が完了次第、github上でお知らせいたします。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ bundle install --without production
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。
このサービスは現在も開発中であるため、状況によってはテストが全てパスしないことがあることをご了承ください。
```
$ rails test
```

テストが無事に通ったら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```
