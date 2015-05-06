require 'faker'
#TODO - this is practically a spec. Just make it one
Option.delete_all
Specification.delete_all
Boat.delete_all
Dock.delete_all
Part.delete_all
Lift.delete_all
def product_range
  (Product.first.id .. Product.last.id).to_a
end

def option_range
  (Option.first.id .. Option.last.id).to_a
end

def spec_range
  (Specification.first.id .. Specification.last.id).to_a
end

10.times do |i|
  Option.create(description: Faker::Company.catch_phrase)
  Specification.create(description: Faker::Company.bs)
  Boat.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
  Dock.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
  Lift.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
  Part.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
 # ShoppingCart.create(products: [Product.find(product_range.sample)])
end
