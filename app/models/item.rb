class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :deliver_pay
  belongs_to :region
  belongs_to :deliver_day
  

  
  with_options presence: { message: 'を入力してください'} do
    validates :item_name
    validates :item_script
    validates :price
  end
  with_options numericality: {other_than:1, message: "can't be blank"} do
    validates :category_id
    validates :item_state_id
    validates :deliver_pay_id
    validates :region_id
    validates :deliver_day_id
  end
  validates :price, numericality: { in: 300..9999999 }
  
  validates_format_of :price, with: /\A\d+\z/, message:'半角数字を使用してください'
end
