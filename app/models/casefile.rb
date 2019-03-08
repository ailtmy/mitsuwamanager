class Casefile < ApplicationRecord
  belongs_to :project
  has_many :customer_casefiles, dependent: :destroy
  has_many :customers, through: :customer_casefiles

  accepts_nested_attributes_for :customer_casefiles, allow_destroy: true

  def self.ransackable_attributes(_auth_object = nil)
    %w(year date kind number event_title)
  end

  def self.ransackable_associations(_auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.csv_attributes
    %w(id year number date event_title event_number count kind project_id created_at updated_at)
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |casefile|
        csv << csv_attributes.map { |attr| casefile.send(attr) }
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

  # 事件簿用（事件当時の住所氏名を返す）
  def self.returnaddr(casefile)
    returnadd = []
    casefile.customer_casefiles.each do |customer|
      customer.customer.addresses.order('since_date desc').each do |addr|
        if !addr.since_date.nil? && addr.since_date <= casefile.date ||= Date.today()
          returnadd << { address: addr.address.to_s }
          break
        end
      end
      returnadd << { cust: "#{customer.applicant} #{customer.customer.name}" }
      returnadd << { path: customer.customer.to_s }
    end
    returnadd
  end
end
