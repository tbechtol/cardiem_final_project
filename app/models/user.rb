class User < ApplicationRecord
  # Direct associations

  has_many   :cars,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :phone_number, :numericality => true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
