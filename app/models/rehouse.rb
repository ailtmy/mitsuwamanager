class Rehouse < Project

  has_many :project_customers, foreign_key: 'project_id', inverse_of: :project
  has_many :customers, through: :project_customers
  accepts_nested_attributes_for :project_customers, allow_destroy: true
  has_many :project_estates
  has_many :estates, through: :project_estates
  belongs_to :user
end