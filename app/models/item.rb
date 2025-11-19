class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :deliver_pay
  belongs_to :region
  belongs_to :deliver_day

  with_options presence: { message: 'を入力してください' } do
    validates :item_name
    validates :item_script
    validates :price
  end
  validates :item_name, length: { maximum: 40, message: '40字以内で記述してください' }
  validates :item_script, length: { maximum: 1000, message: '1000字以内で記述してください' }
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_state_id
    validates :deliver_pay_id
    validates :region_id
    validates :deliver_day_id
  end
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true,
                            message: '300~9999999円の範囲で入力してください' }
  validate :image_presence
  def image_presence
    errors.add(:image, 'を添付してください') unless image.attached?
  end
end
