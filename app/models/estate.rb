class Estate < ApplicationRecord
  has_many :prices, class_name: 'Estate', foreign_key: :estate_id
  accepts_nested_attributes_for :prices
end
