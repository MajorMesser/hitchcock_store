class Category < ActiveRecord::Base
  has_many :products
  validates :name, :description, presence: true
end
