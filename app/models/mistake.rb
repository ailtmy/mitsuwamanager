class Mistake < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  has_many_attached :images

  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :date, presence: true
  

  def self.ransackable_attributes(_auth_object = nil)
    %w(title date category content)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

end
