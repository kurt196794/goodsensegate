FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '久米' }
    first_name            { '太郎' }
    kana_last_name        { 'クメ' }
    kana_first_name       { 'タロウ' }
    birthday              { '1999-01-01' }
  end
end
