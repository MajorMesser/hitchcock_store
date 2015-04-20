class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :products, through: :line_items
  has_many :line_items
  has_many :products
  validates :status, :pst_rate, :gst_rate, :hst_rate, presence: true
  validates :pst_rate, :gst_rate, :hst_rate, numericality: true

  def self.new_order(customer)
    order = customer.orders.build
    order.status = 'pending'
    order.gst_rate = customer.province.gst
    order.pst_rate = customer.province.pst
    order.hst_rate = customer.province.hst
    order
  end
end
