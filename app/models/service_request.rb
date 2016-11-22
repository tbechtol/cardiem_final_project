class ServiceRequest < ApplicationRecord
  before_save :geocode_pickup_location

  def geocode_pickup_location
    if self.pickup_location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.pickup_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.pickup_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.pickup_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.pickup_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  before_save :geocode_repair_center_location

  def geocode_repair_center_location
    if self.repair_center_location.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.repair_center_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.repair_center_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.repair_center_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.repair_center_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :service_notifications,
             :dependent => :destroy

  belongs_to :car,
             :counter_cache => true

  belongs_to :driver,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :car_id, :presence => true

  validates :rc_phone, :presence => true

  validates :rc_phone, :numericality => true

end
