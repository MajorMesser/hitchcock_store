class Province < ActiveRecord::Base
  has_many :customers
  validates :name, presence: true
  validates :pst, :gst, :hst, numericality: true, allow_nil: true
end
