require 'faker'
Option.delete_all
Specification.delete_all
Boat.delete_all
Dock.delete_all
Part.delete_all
Lift.delete_all
def base_model_range
  (BaseModel.first.id .. BaseModel.last.id).to_a
end

def option_range
  (Option.first.id .. Option.last.id).to_a
end

def spec_range
  (Specification.first.id .. Specification.last.id).to_a
end

def parts
  AppConfig.parts.each do |part_name, attrs|
    Part.create(
      name: part_name.humanize,
      id: attrs.part_number,
      description: attrs.description,
      image_path: 'parts',
      price: attrs.price.gsub(/[^\d\.]/, '').to_f
    )
  end
end

def boats
  Boat.create(
    price: Faker::Commerce.price.to_i,
    name: 'Canoe',
    available_options: [Option.find(option_range.sample)],
    specifications: [Specification.find(spec_range.sample)],
    image_path: 'canoes',
    type:       'canoe',
    description: Faker::Lorem.sentence)
  %w[dixie_boats gondolas mark_twains pirate_ships pontoon_boats sea_ventures].each do |boat| Boat.create(
      price: Faker::Commerce.price.to_i,
      name: boat.humanize.singularize,
      available_options: [Option.find(option_range.sample)],
      specifications: [Specification.find(spec_range.sample)],
      image_path: "paddleboats/#{boat}",
      type:       'paddleboat',
      description: Faker::Lorem.sentence)
  end
  %w[blue_herons dragons ducks flamingoes pelicans swans].each do |boat| Boat.create(
      price: Faker::Commerce.price.to_i,
      name: boat.humanize.singularize + ' paddle boat',
      available_options: [Option.find(option_range.sample)],
      specifications: [Specification.find(spec_range.sample)],
      image_path: "paddleboats/waterfowl/#{boat}",
      type:       'waterfowl',
      description: Faker::Lorem.sentence)
  end
  %w[excursion_boats riverboats].each do |boat|
    Boat.create(
      price: Faker::Commerce.price.to_i,
      name: boat.humanize.singularize,
      available_options: [Option.find(option_range.sample)],
      specifications: [Specification.find(spec_range.sample)],
      image_path: "barges/#{boat}",
      type: 'barge',
      description: Faker::Lorem.sentence)
  end
end

10.times do |i|
  Option.create(description: Faker::Company.catch_phrase, price: Faker::Commerce.price.to_f)
  Specification.create(description: Faker::Company.bs)
  Dock.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, available_options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], image_path: 'docks', description: Faker::Lorem.sentence)
  Lift.create(price: Faker::Commerce.price.to_i, name: Faker::Commerce.product_name, available_options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], image_path: 'lifts', description: Faker::Lorem.sentence)
end

ShippingAddress.create(building_number: '510', street: 'N Wesley Dr.', city: 'Jasper',
                       state: 'IN', zip_code: '47546')
cart = ShoppingCart.new
a = User.create(email: 'test@test.com', password: 'test', shopping_cart: cart, shipping_addresses: [ShippingAddress.first])
a.add_role :admin
a.save
parts
boats
