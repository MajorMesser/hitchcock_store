class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category
  validates :name, :description, :price, :stock_quantity, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0.01
  validates_numericality_of :stock_quantity, greater_than_or_equal_to: 0
end
