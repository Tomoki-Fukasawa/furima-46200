require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
  end
  describe '購入所法の保存' do
    context '内容問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buyer_address).to be_valid
      end
      it 'buildingが空でも保存可能' do
        @buyer_address.building = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容問題有' do
      it 'postcodeが空だと保存できない' do
        @buyer_address.postcode = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postcode can't be blank", 'Postcode 半角数字とハイフンだけで正しい文字数で入力してください')
      end
      it 'postcodeに半角のハイフンを含んでいないと保存できない' do
        @buyer_address.postcode = '1234566'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postcode 半角数字とハイフンだけで正しい文字数で入力してください')
      end
      it 'postcodeが正しい文字数以上だと保存できない' do
        @buyer_address.postcode = '123-45667'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postcode 半角数字とハイフンだけで正しい文字数で入力してください')
      end
      it 'postcodeが正しい文字数未満だと保存できない' do
        @buyer_address.postcode = '23-4566'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postcode 半角数字とハイフンだけで正しい文字数で入力してください')
      end
      it 'postcodeに半角のハイフンや数字以外を含んでいると保存できない' do
        @buyer_address.postcode = '一二三-四五六七'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postcode 半角数字とハイフンだけで正しい文字数で入力してください')
      end
      it 'localが空だと保存できない' do
        @buyer_address.local = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Local can't be blank")
      end
      it 'house_numberが空だと保存できない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに半角のハイフンを含んでいると保存できない' do
        @buyer_address.phone_number = '010-123-4567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number 半角数字だけで正しい文字数で入力してください')
      end
      it 'phone_numberが10～11より多いと保存できない' do
        @buyer_address.phone_number = '010123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number 半角数字だけで正しい文字数で入力してください')
      end
      it 'phone_numberが10～11より少ないと保存できない' do
        @buyer_address.phone_number = '0101234'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number 半角数字だけで正しい文字数で入力してください')
      end
      it 'phone_numberが数字以外を含んでいると保存できない' do
        @buyer_address.phone_number = '零101234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Phone number 半角数字だけで正しい文字数で入力してください')
      end
      it 'regionが空だと保存できない' do
        @buyer_address.region_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'userと紐づいていないと、保存できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていないと、保存できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
