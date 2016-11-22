class Car < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :mileage, :presence => true

  validates :mileage, :numericality => true

  validates :model, :presence => true

  validates :year, :presence => true

  validates :year, :numericality => true

end
