require 'faker'
  100.times do
  PhoneNumber.create!(phone_number: Faker::PhoneNumber.phone_number)
end
