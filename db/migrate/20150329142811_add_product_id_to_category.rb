class AddProductIdToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :product_id, index: true
  end
end
