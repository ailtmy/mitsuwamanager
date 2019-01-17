class CustomerAgent < ApplicationRecord
  belongs_to :agent, class_name: 'Customer'
  belongs_to :customer, class_name: 'Customer'

  def selectable_customers
    Customer.all
  end
end
