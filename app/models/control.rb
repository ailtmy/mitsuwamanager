class Control < ApplicationRecord

  has_many :addresses, :as => :addressable, dependent: :destroy
  accepts_nested_attributes_for :addresses
  has_many :tels, :as => :telable, dependent: :destroy
  accepts_nested_attributes_for :tels
  has_many :mails, :as => :mailable, dependent: :destroy
  accepts_nested_attributes_for :mails
  has_many :lands
  has_many :buildings

  def self.csv_attributes
    ["id", "number", "name", "remark", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |control|
        csv << csv_attributes.map{|attr| control.send(attr)}
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      control = new
      control.attributes = row.to_hash.slice(*csv_attributes)
      control.save!
    end
  end
end
