class Project < ApplicationRecord
  has_many :casefiles, dependent: :destroy
  has_many :project_customers, dependent: :destroy
  has_many :mistakes, dependent: :destroy
  has_many :project_estates, foreign_key: :project_id, inverse_of: :project, dependent: :destroy
  has_many :estates, through: :project_estates, dependent: :destroy
  has_many :customers, through: :project_customers, dependent: :destroy
  accepts_nested_attributes_for :project_customers

  def view_project_select
    name + '(ID:' + id.to_s + ')'
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w(name application_date status place_date complete_date report loan_agree request_content)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
