class ShoppingCart < ActiveRecord::Base
  has_many :products
  belongs_to :user

=begin
#TODO: gets the correct quantity from product model, but shows each of the duplicate entries
  def products
    cart_id = id
    Product.select(
      :price,
      :description,
      :class_name,
      :name,
      :base_model_id,
      :shopping_cart_id,
    ).where(shopping_cart_id: id).each do |product|
      product.define_singleton_method(:quantity) do
        Product.where(product.attributes.except(:id, :created_at, :updated_at)).count
        #TODO: with this definition, we'll never have multiple quantity
        ActiveRecord::Base.connection.exec_query(
          "select count(id) as quantity
          from products
          where shopping_cart_id = #{cart_id}
          and id = #{id}"
        ).first['quantity'].to_i
      end
    end
  end
=end

  def subtotal
    products.inject(0) do |sum, product|
      sum + (product.price * product.quantity)
    end
  end
end
