class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.decimal  :price, precision: 5, scale: 2, default: 0.0
      t.belongs_to :product
      t.text :description
      t.timestamps
    end
  end
end
