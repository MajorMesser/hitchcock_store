class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :total_items
      t.string :description

      t.timestamps
    end
  end
end
