# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

## To re-build DB run ##
# $ rails db:drop
# $ rails db:migrate
# $ rails db:seed


## User 1 & Patient Data ##
user = unless User.exists? email: "patient@boc.com"
         User.create! email: "patient@boc.com", password: "password"
       end

unless Patient.exists? first_name: "Kim"
  Patient.create! first_name: "Kim",
    last_name: "Smith",
    contact_phone: "520-277-7779",
    gps: '{"lat": 32.234138, "lng": -110.917638}',
    user: user
end

unless Patient.exists? first_name: "John"
  Patient.create! first_name: "John",
    last_name: "Smith",
    contact_phone: "520-277-7779",
    gps: '{"lat": 32.234138, "lng": -110.917638}',
    user: user
end

unless Patient.exists? first_name: "Kate"
  Patient.create! first_name: "Kate",
    last_name: "Smith",
    contact_phone: "520-277-7779",
    gps: '{"lat": 32.234138, "lng": -110.917638}',
    user: user
end

## User 2 & Patient Data ##
user2 = unless User.exists? email: "patient2@boc.com"
         User.create! email: "patient2@boc.com", password: "password"
       end

unless Patient.exists? first_name: "Frank"
  Patient.create! first_name: "Frank",
    last_name: "White",
    contact_phone: "520-377-7777",
    gps: '{"lat": 32.216346, "lng": -111.026269}',
    user: user2
end

## Doctor Data ##
unless Doctor.exists? last_name: "Smith"
  Doctor.create! first_name: "Mike",
    last_name: "Smith",
    speciality: "General Practice",
    contact_phone: "520-234-2242",
    gps: '{"lat": 32.236161, "lng": -110.892576}'
end

## Doctor Data ##
unless Doctor.exists? last_name: "Thomas"
  Doctor.create! first_name: "Jane",
    last_name: "Thomas",
    speciality: "General Practice",
    contact_phone: "520-477-2122",
    gps: '{"lat": 32.228864, "lng": -110.901256}'
end

## Doctor Data ##
unless Doctor.exists? last_name: "Harris"
  Doctor.create! first_name: "Fred",
    last_name: "Harris",
    speciality: "General Practice",
    contact_phone: "520-577-2322",
    gps: '{"lat": 32.159587, "lng": -111.008552}'
end

admin = unless User.exists? email: "admin@boc.com"
         User.create! email: "admin@boc.com", password: "password", admin: true
       end
