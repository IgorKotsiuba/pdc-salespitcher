FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@salespitcher.com" }
    password   '123456789'
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
  end
end
