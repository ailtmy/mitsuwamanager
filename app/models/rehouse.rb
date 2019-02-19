class Rehouse < Project
  has_many :casefiles, foreign_key: :project_id, dependent: :destroy
  has_many_attached :images
  has_many :project_customers, foreign_key: :project_id, inverse_of: :project, dependent: :destroy
  has_many :customers, through: :project_customers
  accepts_nested_attributes_for :project_customers, allow_destroy: true
  has_many :project_estates, foreign_key: :project_id, inverse_of: :project, dependent: :destroy
  has_many :estates, through: :project_estates
  accepts_nested_attributes_for :project_estates, allow_destroy: true

  has_many :certificates, foreign_key: :project_id, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :certificates, allow_destroy: true
  has_many :destinates, foreign_key: :project_id, dependent: :destroy
  accepts_nested_attributes_for :destinates, allow_destroy: true
  belongs_to :user
end