class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :products, through: :line_items
  has_many :line_items
  has_many :products
  validates :status, :pst_rate, :gst_rate, :hst_rate, presence: true
  validates_numericality_of :pst_rate, :gst_rate, :hst_rate, greater_than_or_equal_to: 0.00
end
