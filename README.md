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
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| firstname      | string | null: false |
| lastname       | string | null: false |
| firstname_kana | string | null: false |
| lastname_kana  | string | null: false |
| birthday       | date   | null: false |


### Association

- has_many :items
- has_many :purchases

## Items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| info                    | text       | null: false                    |
| category_id             | integer    | null: false                    |
| status_id               | integer    | null: false                    |
| ship_charge_id          | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| ship_preparation_day_id | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## Purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_many :user
- belongs_to :item
- has_one :shippingaddress 

## ShippingAddresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| purchase     | references | null: false, foreign_key: true |
| postal_code  | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |


### Association

- belongs_to :purchase
