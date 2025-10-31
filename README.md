# README

## users table
|Column |Type |Options|
|-------|-----|-------|
|nickname|string|null: false|
|email|string| null: false, unique: true|
| encrypted_password | string | null: false |
|name(kanji)||null:false|
|name(kana)||null:false|
|birth_day|integer|null:false|

###Association
-has_many :items
-has_one :buyer

## items table
|Column |Type |Options|
|-------|-----|-------|
|image|image|null: false|
|name|string|null:false|
|item_script|string|null:false|
|category|string|null:false|
|item_state|text|null:false|
|deriver_fee|string|null:false|
|where_from|string|null:false|
|HowManyDayForDerivery|integer|null:false|
|price|integer|null:false|
|feeForSale|integer|null:false|
|ProfitForSale|integer|null:false|

###Association
-belongs_to :buyer
-belongs_to :user

## buyers table
|Column |Type |Options|
|-------|-----|-------|
|nickname|references|null: false|
|email|references| null: false, unique: true|
|where_send_for|string|null:false|
|item|references|null: false, foreign_key|
|user|references|null: false, foreign_key|

###Association
-belongs_to :user
-has_many :items