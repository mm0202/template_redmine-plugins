# template_redmine-plugins
  Readmineプラグイン開発用テンプレート / 複数開発版

## コンテナ起動
```bash
docker-compose up -d
```
ポートなどの設定は[docker-compose.yml](docker-compose.yml)を参照してください。


## ひな形作成 in コンテナ 
コンテナ内で作成する場合は以下の通り。
### コンテナ内へ入る
```bash
docker-compose exec redmine bash
```

### プラグイン生成
```bash
bundle exec rails generate redmine_plugin Sandbox
```
※ 引数にプラグイン名

### コントローラー生成
```bash
bundle exec rails generate redmine_plugin_controller sandbox test index
```
※ 引数はplugin名, controller名, action名

### モデル生成
```bash
bundle exec rails generate redmine_plugin_model sandbox test title:string content:text
```
※ 引数はplugin名, model名, カラム情報

### テーブルの作成
```bash
bundle exec rake redmine:plugins:migrate RAILS_ENV=development
```
※ production環境の場合はRAILS_ENVにproductionを設定

### プラグインが読み込まれない場合は
`docker-compose restart redmine`でRedmineを再起動してください。


## ひな形作成 from ホスト
ホストから作成する場合は以下の通り。

```bash
docker-compose exec redmine bundle exec rails generate redmine_plugin Sandbox

docker-compose exec redmine bundle exec rails generate redmine_plugin_controller sandbox test index

docker-compose exec redmine bundle exec rails generate redmine_plugin_model sandbox test title:string content:text

docker-compose exec redmine bundle exec rake redmine:plugins:migrate RAILS_ENV=development
```
`docker-compose exec`コマンドで、[プラグインの作成 in コンテナ](#ひな形作成-in-コンテナ)と同じことをやっています。

引数などの内容は、[プラグインの作成 in コンテナ](#ひな形作成-in-コンテナ)の説明を参照してください。

## プラグインが読み込まれない場合は
以下のコマンドでRedmineを再起動してください。
```bash
docker-compose restart redmine
```

## Redmineが起動しない場合は
以下のコマンドでRedmineのログをチェックしてください。
```bash
docker-compose logs -f redmine
```

## [plugins/sample](plugins/sample)について
以下の記事を参考にしたサンプルを設置しています。

[Redmine3.2プラグイン開発入門 (1) - 新規画面を追加する](https://qiita.com/saitoxu/items/6731eb80c428459474df)
