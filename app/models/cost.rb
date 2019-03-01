class Cost < ApplicationRecord
  belongs_to :project

  validates :project_id, presence: true
  validate :date_cannoto_future
  validates :pay, numericality: { only_integer: true,  greater_than: 0 }

end


private

def date_cannoto_future
  if date.present? && date >= Date.today
    errors.add(:date, 'は本日より前の日付を指定してください')
  end
end