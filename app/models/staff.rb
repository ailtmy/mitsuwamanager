class Staff < Customer
  has_many :branch_staffs, foreign_key: :staff_id
  has_many :branches, through: :branch_staffs
  accepts_nested_attributes_for :branch_staffs, allow_destroy: true
end
