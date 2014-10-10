shioi
======

A feed reader.


## Requirements

- Ruby 2.x
- PostgreSQL 9.3


## Setup

```
git clone git@github.com:a2ikm/shioi.git
cd shioi
./bin/bootstrap_postgres
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails s
open http://localhost:3000
```


## Update feeds

```
bundle exec rake feed:fetch
```


## Deploying to Heroku

```
git remote add heroku git@heroku.com:serene-mesa-1660.git
git push heroku master
open http://serene-mesa-1660.herokuapp.com/
```
