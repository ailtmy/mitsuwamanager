class Destinate < ApplicationRecord
  belongs_to :project
  belongs_to :customer

  def selectable_customers
    Customer.all
  end
end
