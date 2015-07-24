require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    description { Faker::Company.bs }
    website { Faker::Internet.url }
    username { Faker::Internet.user_name }
    admin false
  end
end
