class Agent < Customer

  has_many :addresses, :as => :addressable
  accepts_nested_attributes_for :addresses
  has_many :customer_agents, foreign_key: :agent_id
  has_many :customers, class_name: 'Customer', through: :customer_agents
  accepts_nested_attributes_for :customer_agents, allow_destroy: true


  # validateに定義したメソッドを設定
  validate :birthday_cannot_be_in_the_future
    

  private
  # 生年月日の未来日のチェックメソッド
  def birthday_cannot_be_in_the_future
    # 生年月日が入力済かつ未来日(現在日付より未来)
    if birthday.present? && birthday > Date.today
      # エラー対象とするプロパティ(birthday)とエラーメッセージを設定
      errors.add(:birthday, "生年月日は過去の日付を指定してください")
    end
  end

end
