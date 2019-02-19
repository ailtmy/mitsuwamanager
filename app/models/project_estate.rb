class ProjectEstate < ApplicationRecord
  belongs_to :project
  belongs_to :estate
  belongs_to :project, class_name: 'Landf', inverse_of: :project_estates
  

  def self.control_name(project_estate)
    if project_estate.estate.type != "Room"
      project_estate.estate.control.name
    else
      apart = Apart.find_by(id: project_estate.estate.apart_room.apart_id)
      apart.control.name
    end
  end
end
