class RemoveCountryFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :country, :string
  end
end
