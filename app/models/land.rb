class Land < Estate
  belongs_to :control
  has_many :prices,  foreign_key: :estate_id
  accepts_nested_attributes_for :prices

  def self.csv_attributes
    ["id", "estate_number", "address", "number", "estate_kind", "area", "remarks", "control_id", "type", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |land|
        csv << csv_attributes.map{|attr| land.send(attr)}
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      land = new
      land.attributes = row.to_hash.slice(*csv_attributes)
      land.save!
    end
  end
end
