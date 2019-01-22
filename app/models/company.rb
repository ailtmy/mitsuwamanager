class Company < Customer

  has_many :customer_agents, foreign_key: :customer_id
  has_many :agents, class_name: 'Customer', through: :customer_agents
  accepts_nested_attributes_for :customer_agents, allow_destroy: true
  has_many :addresses, :as => :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :identifies,  foreign_key: :customer_id, dependent: :destroy
  has_many :branches, foreign_key: :customer_id

  # 設立年月日validateに定義したメソッドを設定
  validate :establishment_cannot_be_in_the_future
  # 次回申請期日validateに定義したメソッドを設定
  validate :next_application_cannot_be_in_the_future
  # 会社法人等番号は12桁　ハイフン無　数字のみ
  validates :company_number, numericality: :only_integr, length: { is: 12, message: 'は12桁の数字（ハイフン無）で入力してください。' }, allow_blank: true
  # 決算期は　1~12のみ
  validates :fiscal_year, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12, message: '１～１２の範囲で指定してください' }, allow_blank: true
  

  private
  # 設立年月日の未来日のチェックメソッド
  def establishment_cannot_be_in_the_future
    # 設立年月日が入力済かつ未来日(現在日付より未来)
    if establishment.present? && establishment > Date.today
      # エラー対象とするプロパティ(establishment)とエラーメッセージを設定
      errors.add(:establishment, "は過去の日付を指定してください")
    end
  end

  # 次回申請期日の過去日のチェックメソッド
  def next_application_cannot_be_in_the_future
    # 設立年月日が入力済かつ未来日(現在日付より未来)
    if next_application.present? && next_application < Date.today
      # エラー対象とするプロパティ(establishment)とエラーメッセージを設定
      errors.add(:next_application, "は未来の日付を指定してください")
    end
  end
end
