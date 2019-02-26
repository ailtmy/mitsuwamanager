class Price < ApplicationRecord
  belongs_to :estate
  belongs_to :land, class_name: 'Estate',  foreign_key: :estate_id
  belongs_to :building, class_name: 'Estate', foreign_key: :estate_id

  def self.ransackable_attributes(auth_object = nil)
    %w[year]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
