class AddAssociations < ActiveRecord::Migration
  def up
    create_table :options_products do |t|
      t.belongs_to :product, null:false, index: true
      t.belongs_to :option, null: false, index: true
    end

  end

  def down
    drop_table :options_products
  end
end
