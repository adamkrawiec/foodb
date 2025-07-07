# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Models

User
  has_many :bookmarks

Meal
  has_many :ingredients
  has_many :bookmarks

Ingredient
  belongs_to :meal

Bookmark
  belongs_to :user
  belongs_to :meal
