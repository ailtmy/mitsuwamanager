class Casefile < ApplicationRecord
  belongs_to :project
  has_many :customer_casefiles, dependent: :destroy
  has_many :customers, through: :customer_casefiles
  accepts_nested_attributes_for :customer_casefiles, allow_destroy: true

  def self.csv_attributes
    ["id", "year", "number", "date", "event_title", "event_number", "count", "kind", "project_id", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |casefile|
        csv << csv_attributes.map{|attr| casefile.send(attr)}
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      casefile = new
      casefile.attributes = row.to_hash.slice(*csv_attributes)
      casefile.save!
    end
  end

  #事件簿用（事件当時の住所氏名を返す）
  def self.returnaddr(casefile)
    returnadd = Array.new
    casefile.customer_casefiles.each do |customer|
      customer.customer.addresses.order('since_date desc').each do |addr|
        if addr.since_date != nil &&addr.since_date <= casefile.date
          returnadd << {:address => "#{addr.address}"}
          break
        end
      end
      returnadd << {:cust => "#{customer.applicant} #{customer.customer.name}"}
      returnadd << {:path => "#{customer.customer}"}
    end
    returnadd
  end
end
