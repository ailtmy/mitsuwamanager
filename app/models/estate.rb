class Estate < ApplicationRecord
  has_many :prices, foreign_key: :estate_id, dependent: :destroy
  accepts_nested_attributes_for :prices, allow_destroy: true
  
  def view_estate_select
    "#{self.address}" +  "#{self.number}"
  end
end
