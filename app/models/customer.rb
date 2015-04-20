class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders
  validates :first_name, :last_name, :address,
            :city, :postal_code, :email, presence: true

  def self.new_customer(params)
    customer = Customer.new(params.permit(:first_name, :last_name, :address,
                                          :city, :postal_code, :email))
    customer.province_id = params[:province]
    customer
  end
end
