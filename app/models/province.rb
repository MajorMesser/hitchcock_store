class Province < ActiveRecord::Base
  has_many :customers
  validates :name, presence: true
  validates_numericality_of :pst, :gst, :hst, greater_than_or_equal_to: 0.00
end
