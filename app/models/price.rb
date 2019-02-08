class Price < ApplicationRecord
  belongs_to :estate
  belongs_to :land, class_name: 'Estate',  foreign_key: :estate_id
end
