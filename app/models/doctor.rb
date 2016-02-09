class Doctor < ApplicationRecord
  include Nameable
  validates :first_name, :last_name, :speciality, :contact_phone, :gps, presence: true
end
