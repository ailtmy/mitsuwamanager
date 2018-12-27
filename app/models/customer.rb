class Customer < ApplicationRecord
  
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

end
