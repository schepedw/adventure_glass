class ShoppingCart < ActiveRecord::Base
  has_and_belongs_to_many :products
  belongs_to :user


  def products
    cart_id = id
    super.uniq.each do |product|
      product.define_singleton_method(:quantity) do
        ActiveRecord::Base.connection.exec_query(
          "select count(product_id) as quantity
          from products_shopping_carts
          where shopping_cart_id = #{cart_id}
          and product_id = #{id}"
        ).first['quantity'].to_i
      end
    end
  end
end
