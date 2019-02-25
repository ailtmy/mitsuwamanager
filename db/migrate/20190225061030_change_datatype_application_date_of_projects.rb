class ChangeDatatypeApplicationDateOfProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :application_date, :date
  end
end
