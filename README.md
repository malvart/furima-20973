## usersテーブル

|Column           |Type     |Options                    |
|-----------------|---------|---------------------------|
| nickname        | string  | null: false               |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| first_name      | string  | null: false               |
| last_name       | string  | null: false               |
| kana_first_name | string  | null: false               |
| kana_last_name  | string  | null: false               |
| birthday        | integer | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column        |Type         |Options                        |
|--------------|------------|--------------------------------|
| item_name    | string     | null: false                    |
| description  | text       | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| charge       | integer    | null: false                    |
| shipper      | integer    | null: false                    |
| shipping_day | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

|Column            |Type        |Options                         |
|------------------|------------|--------------------------------|
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| municipality     | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| user             | references |                                |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item