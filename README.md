# template_redmine-plugins
  Readmineプラグイン開発用テンプレート / 複数開発版

## コンテナ起動
```bash
docker-compose up -d
```
ポートなどの設定は[docker-compose.yml](docker-compose.yml)を参照してください。


## ひな形作成 from ホスト
ホストから作成する場合は以下の通り。
```bash
. setup.sample.plugin.sh
```
中身は[setup.sample.plugin.sh](setup.sample.plugin.sh)を参照してください。

`docker-compose exec`コマンドで、後述の[プラグインの作成 in コンテナ](#プラグインの作成-in-コンテナ)と同じことをやっています。

引数などの内容は、[プラグインの作成 in コンテナ](#プラグインの作成-in-コンテナ)の説明を参照してください。

## ひな形作成 in コンテナ 
コンテナ内で作成する場合は以下の通り。
### コンテナ内へ入る
```bash
docker-compose exec redmine bash
```

### プラグイン生成
```bash
bundle exec rails generate redmine_plugin Sample
```
※ 引数にプラグイン名

### コントローラー生成
```bash
bundle exec rails generate redmine_plugin_controller sample test index
```
※ 引数はplugin名, controller名, action名

### モデル生成
```bash
bundle exec rails generate redmine_plugin_model sample test title:string content:text
```
※ 引数はplugin名, model名, カラム情報

### テーブルの作成
```bash
bundle exec rake redmine:plugins:migrate RAILS_ENV=development
```
※ production環境の場合はRAILS_ENVにproductionを設定


## 実装
プラグインの作成については、以下の記事がおすすめです。
設定や実際の設定などは、以下の記事を参考にしてください。

[Redmine3.2プラグイン開発入門 (1) - 新規画面を追加する](https://qiita.com/saitoxu/items/6731eb80c428459474df)