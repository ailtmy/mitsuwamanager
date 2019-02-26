class User < ApplicationRecord
  has_secure_password
  has_many :projects
  has_many :identifies

  attr_accessor :current_password
  
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: { if: :current_password }

  def self.ransackable_attributes(_auth_object = nil)
    %w(name)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
