class Province < ActiveRecord::Base
  has_many :customers
  validates :name, presence: true
  validates_numericality_of :pst, :gst, :hst, allow_nil: true
end
