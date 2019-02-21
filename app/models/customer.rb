class Customer < ApplicationRecord
  
  has_many :addresses, :as => :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :customer_casefiles
  has_many :casefiles, through: :customer_casefiles
  has_many :customer_agents, foreign_key: 'agent_id'
  has_many :customer_agents, foreign_key: 'customer_id'

  has_many :company_controls, foreign_key: :company_id, inverse_of: :company, dependent: :destroy
  has_many :controls, through: :company_controls, source: :control

  has_many :agents,  class_name: 'Customer', through: :customer_agents
  has_many :customers, class_name: 'Customer', through: :customer_agents
  accepts_nested_attributes_for :customer_agents, allow_destroy: true
  has_many :identifies, dependent: :destroy
  has_many :branches, foreign_key: :customer_id
  has_many :gifts
  has_many :destinates
  has_many :project_customers
  has_many :rehouses, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :landfs, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :inherits, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :commons, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :corps, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :newbuilds, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :destinates, class_name: 'Project', foreign_key: 'customer_id', source: :project, through: :project_customers
  has_many :projects, through: :project_customers
  accepts_nested_attributes_for :project_customers
  has_many :tels, :as => :telable, dependent: :destroy
  accepts_nested_attributes_for :tels
  has_many :mails, :as => :mailable, dependent: :destroy
  accepts_nested_attributes_for :mails

  # 名前はスペースを含めない
  validates :name, presence: true, format: { with: /\A[[^ -~｡-ﾟ"　"" "]]+\z/, message: 'はスペース無しで入力して下さい。'}
  # フリガナは全角カナ、スペースを含めない
  validates :kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ"　"" "]]+\z/, message: 'は全角カタカナスペース無しで入力して下さい。'}, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name kana]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def view_name_select
    self.name + '(ID:' + self.id.to_s + ')'
  end
end
