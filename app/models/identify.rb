class Identify < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  has_many_attached :images

  def self.ransackable_attributes(_auth_object = nil)
    %w(ident_method date_time place)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
