class Unit < Estate
  has_many :estate_units, foreign_key: :unit_id, dependent: :destroy
  has_many :buildings, class_name: 'Estate', through: :estate_units, source: :building, dependent: :destroy
  has_many :rooms, class_name: 'Estate', through: :estate_units, source: :room, dependent: :destroy

  accepts_nested_attributes_for :estate_units, allow_destroy: true
  accepts_nested_attributes_for :units, allow_destroy: true
end