class Judge < ApplicationRecord
  belongs_to :control
  belongs_to :user
  has_many :judge_estates, dependent: :destroy
  has_many :estates, through: :judge_estates
  accepts_nested_attributes_for :judge_estates,  reject_if: :all_blank, allow_destroy: true
  belongs_to :project, optional: true

  has_many_attached :images

  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w(title category content status)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end
end
