FactoryGirl.define do
  factory :doctor, class: Doctor do
    first_name "Joe"
    last_name "Zhivago"
    speciality "General Practice"
    contact_phone "928-277-7777"
    gps '{"lat": 32.236161, "lng": -110.892576}'
  end

  factory :doctor2, parent: :doctor do
    gps '{"lat": 32.228864, "lng": -110.901256}'
  end

  factory :doctor3, parent: :doctor do
    gps '{"lat": 32.159587, "lng": -111.008552}'
  end
end
