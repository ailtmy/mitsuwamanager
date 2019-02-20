class ProjectEstate < ApplicationRecord
  belongs_to :project
  belongs_to :estate
  

  def self.control_name(project_estate)
    if project_estate.estate.type != "Room"
      project_estate.estate.control.name
    else
      project_estate.estate.apart.control.name
    end
  end
end
