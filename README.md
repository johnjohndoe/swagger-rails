Introduction
============

* [Swagger](swagger.wordnik.com) is a specification and complete framework implementation for describing, producing, consuming, and visualizing RESTful web services.

* This project create a backend system for input APIs data by GUI using Ruby on Rails. You can see the lastest demo site on [http://swagger.marsz.tw](http://swagger.marsz.tw/).

Getting Started
======================

* `bundle install` for installing related rubygems
* Setting `config/database.yml` from `config/database.yml.example`
* Setting `config/config.yml` from `config/config.yml.example`. For Facebook login, `facebook_app_id` & `facebook_secret` is necessary to fill in, others' value can be empty.
* `bundle exec rake db:create`
* `bundle exec rake db:migrate`
* Start server with `rails s` and goto http://localhost:3000

Data Structure
==============

* See [Swagger official wiki](https://github.com/wordnik/swagger-core/wiki)

Features
========

* Authenticating through Facebook (only).
* Management your owner RESTful API specifications.
* Auto generating subdomain url for preview API template.
* Custom to setting foreign domain (FQDN).

TODOs
=====

* Revisioning history by API version
* Sharing to other user for management
* Draft data for new API version
* New API version release notice (Subscribed emails, twitter...etc)
* More friendly backend UI

Contribution
============

* Welcome to fork it :p