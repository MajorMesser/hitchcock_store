class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
