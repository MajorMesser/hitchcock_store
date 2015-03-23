class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :quantity, :price, presence: true
  validates_numericality_of :quantity, greater_than_or_equal_to: 0
  validates_numericality_of :price, greater_than_or_equal_to: 0.01
end
