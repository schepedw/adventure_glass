class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :shopping_cart
      t.integer  :quantity
      t.belongs_to :base_model, index: true
      t.timestamps
    end
  end
end
