# Coverage
![Coverage](https://github.com/sergiohc/roverbit/workflows/CI/badge.svg)

### Build
To install all the packages necessary and run:
```shell
docker-compose build

docker-compose run --rm app bundle install

docker-compose run --rm app bundle exec rake db:create

docker-compose up
```


### Run Test
```shell
docker-compose run --rm app bundle exec rspec
```
### Test Input
```shell
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```
### Expected Output
```shell
1 3 N
5 1 E
```
