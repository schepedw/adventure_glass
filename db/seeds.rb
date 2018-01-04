require 'faker'
%w(new confirmed processing processed shipping complete).each do |status|
  Status.find_or_create_by(status: status)
end

if %w(test development).include?(Rails.env)
  Option.delete_all
  Specification.delete_all
  BaseModel.delete_all
  Product.delete_all

  def base_model_range
    BaseModel.all.map(&:id)
  end

  def option_range
    (Option.first.id..Option.last.id).to_a
  end

  def spec_range
    (Specification.first.id..Specification.last.id).to_a
  end

  def parts
    AppConfig.parts.each do |part_name, attrs|
      Part.create!(
        name: part_name.humanize,
        id: attrs.part_number,
        description: attrs.description,
        image_path: 'parts',
        price: attrs.price.gsub(/[^\d\.]/, '').to_f
      )
    end
  end

  def boats
    Boat.create!(
      price: Faker::Commerce.price.to_i,
      name: 'Canoe',
      available_options: [Option.find(option_range.sample)],
      specifications: [Specification.find(spec_range.sample)],
      image_path: 'canoes',
      type:       'canoe',
      description: Faker::Lorem.sentence)
    %w(dixie_boats gondolas mark_twains pirate_ships pontoon_boats sea_ventures).each do |boat|
      Boat.create!(
        price: Faker::Commerce.price.to_i,
        name: boat.humanize.singularize,
        available_options: [Option.find(option_range.sample)],
        specifications: [Specification.find(spec_range.sample)],
        image_path: "paddleboats/#{boat}",
        type:       'paddleboat',
        description: Faker::Lorem.sentence)
    end
    %w(blue_herons dragons ducks flamingoes pelicans swans).each do |boat|
      Boat.create!(
        price: Faker::Commerce.price.to_i,
        name: boat.humanize.singularize + ' paddle boat',
        available_options: [Option.find(option_range.sample)],
        specifications: [Specification.find(spec_range.sample)],
        image_path: "paddleboats/waterfowl/#{boat}",
        type:       'waterfowl',
        description: Faker::Lorem.sentence)
    end
    %w(excursion_boats riverboats).each do |boat|
      Boat.create!(
        price: Faker::Commerce.price.to_i,
        name: boat.humanize.singularize,
        available_options: [Option.find(option_range.sample)],
        specifications: [Specification.find(spec_range.sample)],
        image_path: "barges/#{boat}",
        type: 'barge',
        description: Faker::Lorem.sentence)
    end
    Boat.create!(price: Faker::Commerce.price.to_i, name: '8 Person Riverboat', available_options: [Option.find(option_range.sample)],
                specifications: [Specification.find(spec_range.sample)],
                image_path: 'barges/riverboats',
                type: 'barge',
                description: Faker::Lorem.sentence)

    Boat.create!(price: Faker::Commerce.price.to_i, name: '20 Person Riverboat', available_options: [Option.find(option_range.sample)],
                specifications: [Specification.find(spec_range.sample)],
                image_path: 'barges/riverboats',
                type: 'barge',
                description: Faker::Lorem.sentence)

    Boat.create!(
      price: Faker::Commerce.price.to_i,
      name: 'Excursion Boat',
      available_options: [Option.find(option_range.sample)],
      specifications: [Specification.find(spec_range.sample)],
      image_path: 'barges/excursion_boats',
      type: 'excursion_boat',
      description: Faker::Lorem.sentence
    )
  end

  10.times do
    Option.create!(description: Faker::Company.catch_phrase, price: Faker::Commerce.price.to_f)
    Specification.create!(description: Faker::Company.bs)
    Dock.create!(price: Faker::Commerce.price.to_i, name: 'Super nifty Dock', available_options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], image_path: 'docks', description: Faker::Lorem.sentence)
    Lift.create!(price: Faker::Commerce.price.to_i, name: 'The best Lift ever', available_options: [Option.find(option_range.sample)], specifications: [Specification.find(spec_range.sample)], image_path: 'lifts', description: Faker::Lorem.sentence)
  end

  parts
  boats
end
