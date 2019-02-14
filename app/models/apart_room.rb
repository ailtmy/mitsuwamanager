class ApartRoom < ApplicationRecord
  belongs_to :estate, class_name: 'Apart', foreign_key: 'apart_id', inverse_of: :apart_room
  belongs_to :estate, class_name: 'Room', foreign_key: 'room_id', inverse_of: :apart_room
end
