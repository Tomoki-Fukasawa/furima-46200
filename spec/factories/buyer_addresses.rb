FactoryBot.define do
  factory :buyer_address do
    postcode {'123-4567'}
    region_id { 3 }
    local {'横浜市右京区'}
    house_number { '1-1' }
    building { '東京ハイツ' }
    phone_number {'0101235678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
