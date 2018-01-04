FactoryBot.define do
  factory :option do
    price Faker::Commerce.price.to_f
    description Faker::Lorem.sentence
  end
end
