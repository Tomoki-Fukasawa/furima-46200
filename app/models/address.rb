class Address < ApplicationRecord
  belongs_to :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  with_options presence: { message: 'を入力してください' } do
    validates :postcode
    validates :local
    validates :house_number
    validates :phone_number
  end

  validates :postcode, format:{ with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください'}
  validates :phone_number, format:{ with: /\d{10,11}\z/, message: 'を入力してください'}
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :region_id
  end
end
