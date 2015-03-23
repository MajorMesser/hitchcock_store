class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders
  validates :first_name, :last_name, :address, :city, :country, :postal_code, :email, presence: true

end
