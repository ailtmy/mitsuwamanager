class Person < Customer
  has_many :customer_agents, foreign_key: :customer_id
  has_many :agents, class_name: 'Customer', through: :customer_agents
  accepts_nested_attributes_for :customer_agents, allow_destroy: true
  has_many :addresses, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :identifies, foreign_key: :customer_id, dependent: :destroy
  has_many :tels, as: :telable, dependent: :destroy
  accepts_nested_attributes_for :tels
  has_many :mails, as: :mailable, dependent: :destroy
  accepts_nested_attributes_for :mails

  # validateに定義したメソッドを設定
  validate :birthday_cannot_be_in_the_future

  def self.ransackable_attributes(_auth_object = nil)
    %w(name kana birthday)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.csv_attributes
    %w(id name kana birthday type created_at updated_at)  
  end

  def self.address_csv_attributes
    %w(zip address since_date address_kind)
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |person|
        csv << csv_attributes.map { |attr| person.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      person = new
      address = person.addresses.build
      person.attributes = row.to_hash.slice(*csv_attributes)
      address.attributes = row.to_hash.slice(*address_csv_attributes)
      address.address_closure = false
      person.save!
    end
    
  end
  # def view_name_select
  #   name + '(ID:' + id.to_s + ')'
  # end

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
