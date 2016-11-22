class Car < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :model, :presence => true

  validates :year, :presence => true

  validates :year, :numericality => true

end
