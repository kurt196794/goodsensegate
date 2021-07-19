# README

# ターゲット 目論見
現状フリマサイト上でのアパレル分野はヴィンテージアイテムの取引が少なく、ブランド古着がメインとなっています。
古着屋、一般から値打ち、価値のあるヴィンテージを出品、購入機能によりヴィンテージアイテムのEC市場活性化を図る。
マス、オピニオンリーダー以上のファッションファンをターゲットにし、ヴィンテージアイテム専門による差別化を図った販売サイトです。

# github



* Ruby version _6.0.0_

* Database initialization 'mysql2', '0.5.3'



* System dependencies

* Configuration

* Database creation

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# users テーブル
| Column                | Type   | Options                       |
| --------              | ------ | ----------------------------  |
| nickname              | string | null: false                   |
| email                 | string | null: false, unique:true      | 
| encrypted_ppassword   | string | null: false                   |
| last_name             | string | null: false                   |
| first_name            | string | null: false                   |
| kana_last_name        | string | null: false                   |
| kana_first_name       | string | null: false                   |
| birthday              | date   | null: false                   |

# Association
- has_many  :products
- has_many  :soldouts

# products テーブル
| Column            | Type       | Options                         |
| ----------------  | ------     | ------------------------------- |
| name              | string     | null: false                     |
| user              | references | null: false, foreign_key: true  |
| price             | integer    | null: false                     |
| description       | text       | null: false                     |
| category_id       | integer    | null: false                     |
| condition_id      | integer    | null: false                     |
| shipping_id       | integer    | null: false                     |
| delivery_area_id  | integer    | null: false                     |
| delivery_date_id  | integer    | null: false                     |

# Association
- belongs_to :user
- has_one    :soldout

# soldouts テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :product
- has_one    :buyer

# buyers テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| soldout          | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

# Association
- belongs_to :soldout