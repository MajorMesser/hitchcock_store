class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :quantity, :price, presence: true
  validates :quantity, numericality: true
  validates :price, numericality: true
end
