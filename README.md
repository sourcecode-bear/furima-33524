# README
# テーブル設計

## users テーブル 

| column          | type   | options     |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | text   | null: false |
| last_name       | text   | null: false |
| first_name_kana | text   | null: false |
| last_name_kana  | text   | null: false |
| birth_date      | text   | null: false |

### Association

- has_many :product
- has_many :buyer

## products テーブル

| column            | type          | options           |
|-------------------|---------------|-------------------|
| title             | string        | null: false       |
| image             | ActiveStorage |                   |
| text              | text          | null: false       |
| category          | text          | null: false       |
| condition         | text          | null: false       |
| send_cost         | text          | null: false       |
| prefecture        | text          | null: false       |
| send_days         | text          | null: false       |
| price             | text          | null: false       |
| user              | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

|column               |type        |options            |
|---------------------|------------|-------------------|
| card_id             | text       | null: false       |
| expiration          | text       | null: false       |
| security_code       | text       | null: false       |
| post_number         | text       | null: false       |
| prefecture          | text       | null: false       |
| city                | text       | null: false       |
| house_number        | text       | null: false       |
| building            | text       | null: false       |
| telephone_number    | text       | null: false       |
| user                | references | foreign_key: true |
| product             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product