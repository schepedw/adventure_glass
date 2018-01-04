class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status, null: false, default: 'new'
      t.text :description

      t.timestamps
    end
  end
end
