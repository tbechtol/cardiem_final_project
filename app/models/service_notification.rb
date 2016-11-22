class ServiceNotification < ApplicationRecord
  # Direct associations

  belongs_to :service_request,
             :counter_cache => true

  # Indirect associations

  # Validations

end
