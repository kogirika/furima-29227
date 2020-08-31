# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
6.0.0
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| firstname      | string | null: false |
| lastname       | string | null: false |
| firstname_kana | string | null: false |
| lastname_kana  | string | null: false |
| birthday       | string | null: false |


### Association

- has_many :items
- has_many :transactions

## Items テーブル

| Column               | Type       | Options     |
| ------               | ------     | ----------- |
| image                | string     | null: false |
| name                 | string     | null: false |
| info                 | string     | null: false |
| category             | string     | null: false |
| status               | string     | null: false |
| ship_charge          | string     | null: false |
| ship_from            | string     | null: false |
| ship_preparation_day | string     | null: false |
| price                | integer    | null: false |
| user_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :transaction

## Transaction テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- has_many :user
- belongs_to :item
- has_one :shippingAddress 

## ShippingAddress テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| transaction_id | references | null: false, foreign_key: true |
| postal_code    | string     | null: false |
| prefecture     | string     | null: false |
| address        | string     | null: false |
| building       | string     | null: false |
| phone_number   | string     | null: false |


### Association

- belongs_to :transaction
