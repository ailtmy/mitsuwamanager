class Person < Customer

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
