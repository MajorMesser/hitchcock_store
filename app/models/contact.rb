class Contact < ActiveRecord::Base
  validates :address, :phone, :email, presence: true
end
