class RemoveTotalItemsFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :total_items, :integer
  end
end
