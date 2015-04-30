class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.text :description
      t.belongs_to :product
      t.string     :type

      t.timestamps
    end
  end
end
