class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :category
  validates :name, :description, :price, :stock_quantity, presence: true
  validates :price, numericality: true
  validates :stock_quantity, numericality: true
  mount_uploader :image, ImageUploader
end
