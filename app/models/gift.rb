class Gift < ApplicationRecord
  belongs_to :customer

  def self.selectable_send_receive
    %w(送付 受領)
  end

  def self.selectable_gift_kind
    %w(年賀状 寒中見舞 お中元 暑中見舞 喪中 お歳暮 その他)
  end

  def self.selectable_gift_address
    %w(自宅 勤務先 その他)
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w(gift_kind send_receive gift_year gift_address)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end
end
