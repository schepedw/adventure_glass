class CreateBaseModel < ActiveRecord::Migration
  def change
    create_table :base_models do |t|
      t.decimal  :price, precision: 5, scale: 2
      t.text     :description
      t.string   :class_name
      t.string   :name
      t.string   :type
      t.string   :image_path #TODO: I don't like this

      t.timestamps
    end
  end
end
