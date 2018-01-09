require 'faker'

Admin.create(email: 'admin@salespitcher.com', password: '123456789')
4.times do |n|
  User.create(
    email:                 "user#{n + 1}@salespitcher.com",
    password:              '123456789',
    password_confirmation: '123456789',
    first_name:            Faker::Name.first_name,
    last_name:             Faker::Name.last_name,
    phone_number:          Faker::PhoneNumber.phone_number
  )
end
