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
| shipping            | references | foreign_key: true |
| credit_card         | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping
- has_one :credit_card

# shippings

|column               |type        |options            |
|---------------------|------------|-------------------|
| post_number         | integer    | null: false       |
| prefecture _id      | integer    | null: false       |
| city                | string     | null: false       |
| house_number        | text       | null: false       |
| building            | string     | null: false       |
| telephone_number    | integer    | null: false       |
| buyer               | references | foreign_key: true |

### Association

- belongs_to :buyer

## credit_cards

|column               |type        |options            |
|---------------------|------------|-------------------|
| card_id             | integer    | null: false       |
| expiration          | date       | null: false       |
| security_code       | integer    | null: false       |
| buyer               | references | foreign_key: true |

### Association

- belongs_to :buyer