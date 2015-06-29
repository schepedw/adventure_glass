class AddAssociations < ActiveRecord::Migration

  def up
    create_table :selected_product_options do |t|
      t.belongs_to :product, null:false, index: true
      t.belongs_to :option, null: false, index: true
    end

    create_table :products_specifications do |t|
      t.belongs_to :product, null: false, index: true
      t.belongs_to :specification, null: false, index: true
    end
  end

  def down
    drop_table :selected_product_options
    drop_table :products_specifications
  end
end
