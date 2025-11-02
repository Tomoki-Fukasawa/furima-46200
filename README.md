# README

## users table
|Column |Type |Options|
|-------|-----|-------|
|nickname|string|null: false|
|email|string| null: false, unique: true|
| encrypted_password | string | null: false |
|first_name_kanji|string|null:false|
|last_name_kanji|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birth_day|integer|null:false|

###Association
-has_many :items
-has_one :buyer

## items table
|Column |Type |Options|
|-------|-----|-------|

|item_name|string|null:false|
|item_script|text|null:false|
|category|references|null: false, foreign_key|
|item_state|references|null: false, foreign_key|
|deriver_pay|references|null: false, foreign_key|
|region|references|null: false, foreign_key|
|deriver_day|references|null: false, foreign_key|
|price|integer|null:false|


###Association
-belongs_to:buyer
-belongs_to:user
-belongs_to:category
-belongs_to:item_state
-belongs_to:deriver_pay
-belongs_to:deriver_day
-has_one_attached:item-image

## buyers table
|Column |Type |Options|
|-------|-----|-------|
|nickname|references|null: false|
|email|references| null: false, unique: true|
|name|references|null: false, foreign_key|
|user|references|null: false, foreign_key|

###Association
-belongs_to :user
-has_many :items
-has_one :address

## addresses table
|Column |Type |Options|
|-------|-----|-------|
|postcode|integer|null:false|
|local|string|null:false|
|house_number|integer|null:false|
|building|text|null|
|phone_number|integer|null:false|
|buyer|references|null: false, foreign_key|
|region|references|null:false,foreign_key|

##Association
-belongs_to :buyer
-belongs_to :region

## regions table
|Column |Type |Options|
|-------|-----|-------|
|region_id|integer|null:false|
-has_many :addresses
-has_many :regions