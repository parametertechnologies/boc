class Doctor < ApplicationRecord
  include Nameable
  validates :first_name, :last_name, :speciality, :contact_phone, :gps, presence: true

  def self.gps_list
    doctors = all.pluck(:gps)
    "[#{doctors.map {|gps| "#{gps}"}.join(',')}]"
  end
end
