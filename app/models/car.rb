class Car < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :make, :presence => true

  validates :mileage, :presence => true

  validates :mileage, :numericality => true

  validates :model, :presence => true

  validates :year, :presence => true

  validates :year, :numericality => true

end
