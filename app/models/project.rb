class Project < ApplicationRecord
  has_many :casefiles
  has_many :project_customers
  has_many :customers, through: :project_customers
  accepts_nested_attributes_for :project_customers

  def view_project_select
    self.name + '(ID:' + self.id.to_s + ')'
  end
end
