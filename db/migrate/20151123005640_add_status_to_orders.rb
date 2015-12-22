class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :status, index: true, null: false
    Status['new'] || Status.create(status: 'new', description: 'Freshly Created')
  end
end
