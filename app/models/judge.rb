class Judge < ApplicationRecord
  belongs_to :control
  belongs_to :user
  belongs_to :estate, optional: true
  belongs_to :project, optional: true

  has_many_attached :images

  validetes :title, presence: true
  validates :category, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w(title datetime category content answer status event)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
