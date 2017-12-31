FactoryBot.define do
  factory :base_model do
    price Faker::Commerce.price.to_f
    description Faker::Lorem.sentence
    name Faker::Lorem.word

    trait :boat do
      class_name 'Boat'
    end
    trait :lift do
      class_name 'Lift'
    end
    trait :Dock do
      class_name 'Dock'
    end
    trait :Part do
      class_name 'Part'
    end
  end
end
