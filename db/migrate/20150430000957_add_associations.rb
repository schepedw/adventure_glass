class AddAssociations < ActiveRecord::Migration
  def up
    create_table :options_products do |t|
      t.belongs_to :product, null:false, index: true
      t.belongs_to :option, null: false, index: true
    end

    create_table :products_shopping_carts do |t|
      t.timestamps null: false
      t.belongs_to  :shopping_cart, null: false, index: true
      t.belongs_to  :product, null: false, index: true
    end
  end

  def down
    drop_table :options_products
    drop_table :shopping_carts_products
  end
end
