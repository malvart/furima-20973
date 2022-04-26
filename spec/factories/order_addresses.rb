FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '札幌市' }
    house_number { '1-2' }
    building_name { '札幌ビルディング' }
    telephone_number { 1_234_567_890 }
    token { Faker::Lorem }
  end
end
