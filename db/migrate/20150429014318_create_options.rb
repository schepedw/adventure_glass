class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
