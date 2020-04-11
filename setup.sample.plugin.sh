docker-compose exec redmine bundle exec rails generate redmine_plugin Sample
docker-compose exec redmine bundle exec rails generate redmine_plugin_controller sample test index
docker-compose exec redmine bundle exec rails generate redmine_plugin_model sample test title:string content:text
docker-compose exec redmine bundle exec rake redmine:plugins:migrate RAILS_ENV=development