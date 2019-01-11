class CustomerCasefile < ApplicationRecord
  belongs_to :customer
  belongs_to :casefile

  def selectable_customers
    Customer.all
  end
end
