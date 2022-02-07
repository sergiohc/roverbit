docker-compose build

docker-compose run --rm app bundle install

docker-compose run --rm app bundle exec rake db:create

docker-compose up
