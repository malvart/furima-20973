FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {Gimei.first.kanji}
    last_name {Gimei.last.kanji}
    kana_first_name {Gimei.first.katakana}
    kana_last_name {Gimei.last.katakana}
    birthday  {Faker::Date.backward}
  end
end