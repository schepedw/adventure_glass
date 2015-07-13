class AddAssociations < ActiveRecord::Migration

  def up
    create_table :selected_product_options do |t|
      t.belongs_to :product, null:false, index: true
      t.belongs_to :option, null: false, index: true
    end

    create_table :base_models_specifications do |t|
      t.belongs_to :base_model, null: false, index: true
      t.belongs_to :specification, null: false, index: true
    end
  end

  def down
    drop_table :selected_product_options
    drop_table :base_models_specifications
  end
end
