require 'faker'
Option.delete_all
Specification.delete_all
Boat.delete_all
Dock.delete_all
Part.delete_all
Lift.delete_all
def product_range
  @range ||= (Product.first.id .. Product.last.id).to_a
end
10.times do |i|
  Boat.create(price: Faker::Commerce.price.to_i, description: Faker::Commerce.product_name)
  Dock.create(price: Faker::Commerce.price.to_i, description: Faker::Commerce.product_name)
  Lift.create(price: Faker::Commerce.price.to_i, description: Faker::Commerce.product_name)
  Part.create(price: Faker::Commerce.price.to_i, description: Faker::Commerce.product_name)
  Option.create(description: Faker::Company.catch_phrase, product_id: product_range.sample)
  Specification.create(description: Faker::Company.bs, product_id: product_range.sample)
end
