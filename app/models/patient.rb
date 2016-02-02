class Patient < ApplicationRecord
  include Nameable
  validates :first_name, :last_name, :contact_phone, presence: true
end
