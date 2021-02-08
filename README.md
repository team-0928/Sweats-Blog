# Sweets Blog

Sweets Blogは利用者同士でスイーツの情報を共有することができるサービスです。スイーツの名前や、イメージ、店の住所などを入力して投稿しましょう。誰かがいいね！を付けてくれるかもしれません！今後もサービスの向上を目指してくのでお楽しみに！

このアプリの仕組みをより理解してもらうため、サンプルユーザーを登録させています。
セキュリティの都合上、ユーザー登録を行いたくない場合はサンプルユーザーでログインすることができます。
以下のユーザー情報を利用してください。
- メールアドレス example-30@railstutorial.org
- パスワード　password

ログインが完了次第、自由に投稿、変更、削除、いいね！をしていただいて構いません。


## アプリの更新情報（2021/2/8）

- デザインを変更し、投稿一覧が見やすくなりました
- ユーザーのフォロー機能を追加しました
- いいね！やフォローボタンにAjaxを導入しました
- 画像を複数枚投稿できるようになりました。投稿詳細ページのスライドにて表示を切り替えることができます
- カテゴリや地名などのキーワードで検索する機能を追加しました。しかし、現在入力可能なキーワード数は1つのみです

## アプリ使用上の注意

1. コスト面を考慮して、サーバの起動時間を限定しております。EC2の起動時間はAM9:00からPM18:00になります。しかし、サービスの改善中は上記の時間でもアクセスができない場合があるのでご了承ください。
2. トップページのレンダリングや画像の読み込みに遅延があるようですのでご容赦ください。

## アプリのURL

https://www.sweets-blog.awssample92.com/

## アプリのガイド(PDF)

ブログサイトを改良しましたので、ガイドを再作成しています。
もうしばらくお待ちください。

## アプリの動作環境

- Ruby on Rails(フレームワーク)
- AWS(本番環境)
- MySQL(データベース）
- SendGrid(メール送信)

HerokuからAWSへ環境を移行しました。ロードバランサーを導入することでHTTPSによる通信が可能となっています。

## 使い方(開発環境上)

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

## 参考にした書籍やサービス

### Webサービス

- Railsチュートリアル Rails 6.0（第6版）

### 書籍

- Amazon Web Services 基礎からのネットワーク&サーバー構築 改訂3版 (日本語)
- ゼロからわかる Amazon Web Services超入門 はじめてのクラウド かんたんIT基礎講座
