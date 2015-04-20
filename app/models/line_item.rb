class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :quantity, :price, presence: true
  validates :quantity, numericality: true
  validates :price, numericality: true

  def self.new_line_item(item, order)
    line_item = order.line_items.build
    line_item.quantity = 1
    line_item.product = item
    line_item.price = item.price
    line_item
  end
end
