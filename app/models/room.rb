class Room < Estate
  has_one :apart_room, foreign_key: :room_id,  inverse_of: :room, dependent: :destroy
  has_one :apart,  through: :apart_room, source: :apart, dependent: :destroy
  accepts_nested_attributes_for :apart_room, allow_destroy: true

  has_many :estate_units, foreign_key: :estate_id, dependent: :destroy
  has_many :units, class_name: 'Estate', through: :estate_units, source: :unit, dependent: :destroy
  accepts_nested_attributes_for :units, allow_destroy: true
  
  has_many :sites, dependent: :destroy
  has_many :lands, through: :sites, source: :estate, dependent: :destroy
  accepts_nested_attributes_for :sites, allow_destroy: true

  def self.csv_attributes
    ["id", "estate_number", "number" ,"apart_name", "estate_kind", "structure", "area", "type", "remarks", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |room|
        csv << csv_attributes.map{|attr| room.send(attr)}
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      room = new
      room.attributes = row.to_hash.slice(*csv_attributes)
      room.save!
    end
  end
end