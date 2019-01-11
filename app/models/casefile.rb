class Casefile < ApplicationRecord
  belongs_to :project
  has_many :customer_casefiles
  has_many :customers, through: :customer_casefiles
  accepts_nested_attributes_for :customer_casefiles, allow_destroy: true
end
