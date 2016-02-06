FactoryGirl.define do
  factory :patient do
    first_name "John"
    last_name "Smith"
    contact_phone "928-277-7777"
    gps '{"lat": 32.234138, "lng": -110.917638}'
  end
end
