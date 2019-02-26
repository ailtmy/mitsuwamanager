class Estate < ApplicationRecord
  belongs_to :control
  has_many :prices, foreign_key: :estate_id, dependent: :destroy
  accepts_nested_attributes_for :prices, allow_destroy: true
  
  def view_estate_select
    "#{self.address}" +  "#{self.number}"
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[address number estate_number apart_name]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
