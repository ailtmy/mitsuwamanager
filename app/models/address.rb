class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :zip, numericality: { only_integer: true, message: 'はハイフン無の半角数字で入力してください。' },
   length: { is: 7 }, allow_blank: true
   
  def self.ransackable_attributes(_auth_object = nil)
    %w(address)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end
end
