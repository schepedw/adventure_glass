class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.timestamps
      t.belongs_to     :user
    end
  end
end
