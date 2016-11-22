class ServiceRequest < ApplicationRecord
  # Direct associations

  belongs_to :driver,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :car_id, :presence => true

  validates :rc_phone, :presence => true

  validates :rc_phone, :numericality => true

end
