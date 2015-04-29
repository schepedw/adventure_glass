class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal5 :price
      t.decimal2 :price
      t.text :description

      t.timestamps
    end
  end
end
