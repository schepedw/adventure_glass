class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal  :price, precision: 5, scale: 2
      t.text     :description
      t.string   :class_name
      t.string   :name
      t.string   :type
      t.string   :image_path #TODO: I don't like this
      t.belongs_to :shopping_cart
      t.integer  :quantity

      t.references :base_model, index: true
      t.timestamps
    end
  end
end
