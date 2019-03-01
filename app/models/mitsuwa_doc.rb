class MitsuwaDoc < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  validates :title, presence: true
  validates :category, presence: true
  validates :kind, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w(title date category kind content)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
