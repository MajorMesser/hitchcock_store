class Product < ActiveRecord::Base;
  has_many :orders, through: :line_items
  belongs_to :category
end
