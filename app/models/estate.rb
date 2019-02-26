class Estate < ApplicationRecord
  belongs_to :control
  has_many :prices, foreign_key: :estate_id, dependent: :destroy
  accepts_nested_attributes_for :prices, allow_destroy: true

  def view_estate_select
    address.to_s + number.to_s
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w(address number estate_number apart_name)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
