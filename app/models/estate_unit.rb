class EstateUnit < ApplicationRecord
  belongs_to :building, class_name: 'Estate', foreign_key: :estate_id
  belongs_to :unit, class_name: 'Estate', foreign_key: :unit_id
  belongs_to :room, class_name: 'Estate', foreign_key: :unit_id
end
