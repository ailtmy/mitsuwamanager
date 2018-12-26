class Customer < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[name kana]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
