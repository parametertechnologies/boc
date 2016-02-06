class Patient < ApplicationRecord
  include Nameable
  belongs_to :user
  validates :first_name, :last_name, :contact_phone, :gps, presence: true
end
