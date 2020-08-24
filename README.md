# README

# テーブル設計

## users テーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| email            | string | null: false unique: true |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| family_name_kana | string | null: false              |
| first_name_kana  | string | null: false              |
| birth_date       | date   | null: false              |

### Association

- has_many :items
- has_many :purchases
- has_one :destination

## items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null: false foreign_key: true |
| name             | string     | null: false                   |
| description      | text       | null: false                   |
| category_id      | integer    | null: false                   |
| status_id        | integer    | null: false                   |
| postage_payer_id | integer    | null: false                   |
| prefectures_id   | integer    | null: false                   |
| shipping_days_id | integer    | null: false                   |
| price            | string     | null: false                   |

### Association

- has_many :images
- has_many :purchases
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_day

## purchases テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| item             | references | null: false foreign_key: true |
| user             | references | null: false foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## destinations テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null: false foreign_key: true |
| post_code        | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| build_name       | string     |                               |
| phone_number     | string     | null: false                   |

### Association

- has_one :user
- belongs_to_active_hash :prefecture

## images テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| image            | string     | null: false                     |
| item             | references | null: false foreign_key: true   |

### Association

- belongs_to :item