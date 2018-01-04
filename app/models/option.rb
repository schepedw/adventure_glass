class Option < ActiveRecord::Base
  resourcify
  belongs_to :products, optional: true

  def price_to_s
    format('%0.02f', price)
  end
end
