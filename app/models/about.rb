class About < ActiveRecord::Base
  validates :title, :description, presence: true
end
