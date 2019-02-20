class ApartRoom < ApplicationRecord
  belongs_to :apart, class_name: 'Estate', foreign_key: 'apart_id'
  belongs_to :room, class_name: 'Estate', foreign_key: 'room_id'
end
