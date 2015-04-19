class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :products, through: :line_items
  has_many :line_items
  has_many :products
  validates :status, :pst_rate, :gst_rate, :hst_rate, presence: true
  validates :pst_rate, :gst_rate, :hst_rate, numericality: true
end
