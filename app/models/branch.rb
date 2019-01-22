class Branch < ApplicationRecord
  belongs_to :company, foreign_key: :customer_id
  has_many :addresses, :as => :addressable, dependent: :destroy
  has_many :branch_staffs
  has_many :staffs, class_name: 'Customer', through: :branch_staffs
  accepts_nested_attributes_for :branch_staffs, allow_destroy: true
end