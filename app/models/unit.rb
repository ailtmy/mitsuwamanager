class Unit < Estate
  has_many :estate_units, foreign_key: :unit_id, dependent: :destroy
  has_many :estates, class_name: 'Estate', through: :estate_units, dependent: :destroy
  accepts_nested_attributes_for :estate_units, allow_destroy: true
end