class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postcode, :region_id, :local, :house_number,:building, :phone_number,:user_id,:item_id,:token

  with_options presence: true do
    validates :postcode, format:{ with: /\A\d{3}[-]\d{4}\z/, message: '半角数字とハイフンだけで正しい文字数で入力してください'}
    validates :local
    validates :house_number
    validates :phone_number,format:{ with: /\A\d{10,11}\z/, message: '半角数字だけで正しい文字数で入力してください'}
    validates :user_id
    validates :item_id
  end
  
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :region_id
  end

  validates :token, presence: true

  def save
    buyer=Buyer.create(user_id: user_id,item_id: item_id)

    Address.create(postcode: postcode, region_id: region_id, local: local, house_number: house_number,building: building, phone_number: phone_number,buyer_id: buyer.id)
  end
end