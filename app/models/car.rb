class Car < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :year, :presence => true

  validates :year, :numericality => true

end
