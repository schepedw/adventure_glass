class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string     :building_number, null: false
      t.string     :apt_or_unit_number
      t.string     :street, null: false
      t.string     :city, null: false
      t.string     :state, null: false
      t.integer    :zip_code, null: false
      t.string     :type #needed for inheritance, in case we later want billing / shipping address
      t.timestamps
    end
  end
end
