class ServiceRequest < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rc_phone, :numericality => true

end
