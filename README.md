# README

## users table
|Column |Type |Options|
|-------|-----|-------|
|nickname|string|null: false|
|email|string| null: false, unique: true|
|encrypted_password | string | null: false |
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_day|date|null:false|

###Association
-has_many :items
-has_one :buyer

## items table
|Column |Type |Options|
|-------|-----|-------|

|item_name|string|null:false|
|item_script|text|null:false|
|category|integer|null: false, foreign_key|
|item_state|integer|null: false, foreign_key|
|deriver_pay|integer|null: false, foreign_key|
|region|integer|null: false, foreign_key|
|deriver_day|integer|null: false, foreign_key|
|price|integer|null:false|
|user|references|null: false, foreign_key|


###Association
-belongs_to:buyer
-belongs_to:user

-has_one_attached:item-image

## buyers table
|Column |Type |Options|
|-------|-----|-------|
|item|references| null: false, foreign_key|
|user|references|null: false, foreign_key|

###Association
-belongs_to :user
-has_many :items
-has_one :address

## addresses table
|Column |Type |Options|
|-------|-----|-------|
|postcode|string|null:false|
|house_number|integer|null:false|
|building|text|
|phone_number|string|null:false|
|buyer|references|null: false, foreign_key|
|region|integer|null:false,foreign_key|

##Association
-belongs_to :buyer

