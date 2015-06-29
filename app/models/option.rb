class Option < ActiveRecord::Base
  resourcify
  belongs_to :products

  def price_to_s
    sprintf( "%0.02f", price)
  end
end
