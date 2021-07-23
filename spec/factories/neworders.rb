FactoryBot.define do
  factory :neworder do

    postal_code { "123-1234" }
    municipalities { '丹荘' }
    address { '1' }
    building_name { 'シティ志木' }
    phone_number { "12345678987" }
    delivery_area_id{2}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
