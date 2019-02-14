class Site < ApplicationRecord
  belongs_to :estate, class_name: 'Room', foreign_key: 'room_id'
  belongs_to :estate, class_name: 'Land', foreign_key: 'land_id'
end
