class AddAssociations < ActiveRecord::Migration
  def up
    create_table :shopping_carts_products do |t|
      t.timestamps null: false
      t.belongs_to  :shopping_cart, null: false, index: true
      t.belongs_to  :product, null: false, index: true
    end

    create_table :products_options do |t|
      t.belongs_to :product, null:false, index: true
      t.belongs_to :option, null: false, index: true
    end

    create_table :shopping_carts_products_options do |t|
      t.timestamps null: false
      t.belongs_to  :shopping_cart, null: false, index: true
      t.belongs_to  :products_option, null: false, index: true
    end
  end

  def down
  end
end
