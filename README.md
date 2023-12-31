# README

## Requirements

- PostgreSQL `sudo apt install postgresql`
- Yarn `npm install yarn`
- Bundler `gem install bundle`
- Ruby 3.2.0

## Getting started

### Clone the repository
```shell
git clone git@github.com:rsosag/dataprop.git
```
### Move to the project directory
```shell
cd dataprop
```
### Install gems dependencies
```shell
bundle install
```
### Install yarn dependencies
```shell
yarn install
yarn build:css
rails assets:procompile
```
### Create and populate the database
```shell
rails db:create
rails db:migrate
rails db:seed
```
### Start Rails:
```shell
bundle exec rails server
```

### How to run tests
```shell
bundle exec rspec
```
### ERD

[![ERD](https://i.imgur.com/anN4joO.png)](https://i.imgur.com/anN4joO.png)


