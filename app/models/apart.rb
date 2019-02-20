class Apart < Estate
  belongs_to :control
  has_many :apart_rooms, foreign_key: :apart_id, dependent: :destroy
  has_many :rooms, through: :apart_rooms, source: :room, dependent: :destroy
  accepts_nested_attributes_for :apart_rooms, allow_destroy: true
  accepts_nested_attributes_for :rooms, allow_destroy: true


  def self.csv_attributes
    ["id", "address", "apart_name", "apart_structure", "apart_area", "control_id", "type", "remarks", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |apart|
        csv << csv_attributes.map{|attr| apart.send(attr)}
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      apart = new
      apart.attributes = row.to_hash.slice(*csv_attributes)
      apart.save!
    end
  end
end