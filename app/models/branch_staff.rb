class BranchStaff < ApplicationRecord
  belongs_to :staff, class_name: 'Customer'
  belongs_to :branch
end
