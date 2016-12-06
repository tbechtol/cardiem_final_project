class ServiceNotification < ApplicationRecord
  # Direct associations

  belongs_to :service_request,
             :counter_cache => true

  # Indirect associations

  has_one :car, through: :service_request

  # Validations

end
