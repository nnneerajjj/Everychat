# Every Chat

![circle ci](https://circleci.com/gh/iguchi1124/EveryChat/tree/master.svg?&circle-token=21348c5d65f5425abbec191ccd17e214658f0965)

This is real time chat application, create with rails 5.

## Setup

```
% vagrant up
% vagrant ssh
% cd /vagrant
% bundle install --path vendor/bundle
% bundle exec rails db:create
% bundle exec rails db:migrate
```

## Run server

```
% bundle exec foreman start -f Procfile.local
```

## Test

```
% bundle exec rubocop
% bundle exec rails test
```
