class Mail < ApplicationRecord
  belongs_to :mailable, polymorphic: true
end
