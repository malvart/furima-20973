FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.words(number: 1, supplemental: true) }
    description { Faker::Lorem.sentences(number: 1, supplemental: true) }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    charge_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    shipping_day_id { rand(2..4) }
    price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/icon_camera.png'), filename: 'icon_camera.png')
    end
  end
end
