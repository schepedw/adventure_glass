require 'faker'
Option.delete_all
Specification.delete_all
Boat.delete_all
Dock.delete_all
Part.delete_all
Lift.delete_all
ShoppingCart.delete_all
def product_range
  (Product.first.id .. Product.last.id).to_a
end

def option_range
  (Option.first.id .. Option.last.id).to_a
end

def spec_range
  (Specification.first.id .. Specification.last.id).to_a
end

def base_products
  AppConfig.parts.each do |part_name, attrs|
    Part.create(
      name: part_name,
      id: attrs.part_number,
      description: attrs.description,
      price: attrs.price.gsub(/[^\d\.]/, '').to_f
    )
  end
end
base_products
cart = ShoppingCart.new

10.times do |i|
  Option.create(description: Faker::Company.catch_phrase)
  ShippingAddress.create(building_number: '510', street: 'N Wesley Dr.', city: 'Jasper',
                         state: 'IN', zip_code: '47546')
  Specification.create(description: Faker::Company.bs)
  b = Boat.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
  d = Dock.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
  l = Lift.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], description: Faker::Lorem.sentence)
  cart.products += ([b,d,l] << [b,d,l].sample)
  cart.save!
end

User.create(email: 'test@test.com', password: 'test', shopping_cart: cart, shipping_addresses: [ShippingAddress.first])
