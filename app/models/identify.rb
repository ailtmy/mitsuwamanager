class Identify < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  has_many_attached :images
end
