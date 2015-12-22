class AddConstraintsToModels < ActiveRecord::Migration
  def change
    change_column_null :base_models, :price, false
    change_column_null :base_models, :description, false
    change_column_null :base_models, :name, false
    change_column_null :orders, :user_id, false
    change_column_null :options, :description, false
    change_column_null :options, :price, false
    change_column_null :products, :shopping_cart_id, false
    change_column_null :products, :quantity, false
    change_column_null :products, :base_model_id, false
    change_column_null :specifications, :description, false
  end
end
