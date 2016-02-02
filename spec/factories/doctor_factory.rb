FactoryGirl.define do
  factory :doctor, class: Doctor do
    first_name "Joe"
    last_name "Zhivago"
    speciality "General Practice"
    contact_phone "928-277-7777"
  end
end
