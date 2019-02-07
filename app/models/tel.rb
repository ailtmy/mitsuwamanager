class Tel < ApplicationRecord
  belongs_to :telable, polymorphic: true
end
