class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.belongs_to  :base_model
      t.text :description
      t.string     :type

      t.timestamps
    end
  end
end
