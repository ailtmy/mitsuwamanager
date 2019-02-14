class EstateUnit < ApplicationRecord
  belongs_to :estate
  belongs_to :estate, class_name: 'Unit', foreign_key: 'unit_id'
end
