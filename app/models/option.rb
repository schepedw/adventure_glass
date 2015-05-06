class Option < ActiveRecord::Base
  has_and_belongs_to_many :products

  def self.available_for(product_name)
    #TODO - implement
    [Option.first, Option.second, Option.last]
  end
end
