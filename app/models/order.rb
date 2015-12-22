class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  has_many :products, through: :shopping_cart
  belongs_to :shopping_cart
  before_save :default_status

  private

  def default_status
    self.status ||= Status['new']
  end
end
