class Mail < ApplicationRecord
  belongs_to :mailable, polymorphic: true

  def self.ransackable_attributes(auth_object = nil)
    %w[mail_address]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end
end
