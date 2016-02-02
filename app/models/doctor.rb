class Doctor < ApplicationRecord
  validates :first_name, :last_name, :speciality, :contact_phone, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
