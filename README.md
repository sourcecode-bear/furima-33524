# README
# テーブル設計

## users テーブル 

| column             | type   |options                  |
|--------------------|--------|-------------------------|
| nickname           | string |null: false              |
| email              | string |null: false, unique: true|
| encrypted_password | string |null: false              |
| first_name         | string |null: false              |
| last_name          | string |null: false              |
| first_name_kana    | string |null: false              |
| last_name_kana     | string |null: false              |
| birth_date         | date   |null: false              |

### Association

- has_many :products
- has_many :buyers

## products テーブル

| column            | type          | options           |
|-------------------|---------------|-------------------|
| title             | string        | null: false       |
| text              | text          | null: false       |
| category_id       | integer       | null: false       |
| condition_id      | integer       | null: false       |
| cost_id           | integer       | null: false       |
| prefecture_id     | integer       | null: false       |
| days_id           | integer       | null: false       |
| price             | integer       | null: false       |
| user              | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

|column               |type        |options            |
|---------------------|------------|-------------------|
| user                | references | foreign_key: true |
| product             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping


# shippings

|column               |type        |options            |
|---------------------|------------|-------------------|
| post_number         | string     | null: false       |
| prefecture _id      | integer    | null: false       |
| city                | string     | null: false       |
| house_number        | string     | null: false       |
| building            | string     |                   |
| telephone_number    | string     | null: false       |
| buyer               | references | foreign_key: true |

### Association

- belongs_to :buyer