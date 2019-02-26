class Building < Estate
  belongs_to :control
  has_many :prices, foreign_key: 'estate_id', dependent: :destroy
  accepts_nested_attributes_for :prices, allow_destroy: true

  has_many :estate_units, foreign_key: :estate_id, dependent: :destroy
  has_many :units, class_name: 'Estate', through: :estate_units, source: :unit, dependent: :destroy
  accepts_nested_attributes_for :estate_units, allow_destroy: true
  accepts_nested_attributes_for :units, allow_destroy: true

  def self.csv_attributes
    %w(id number name remark created_at updated_at)
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |control|
        csv << csv_attributes.map { |attr| control.send(attr) }
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
