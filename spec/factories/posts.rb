FactoryBot.define do
  factory :post do
    group
    title { Faker::Lorem.word }
    body  { Faker::Lorem.sentence }
  end
end
