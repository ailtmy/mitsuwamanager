class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    %w[address]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end
end
