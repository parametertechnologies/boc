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

unless Patient.exists? first_name: "John"
  Patient.create! first_name: "John",
    last_name: "Thomas",
    contact_phone: "520-377-7777",
    gps: '{"lat": 32.216346, "lng": -111.026269}',
    user: user2
end

## Doctor Data ##
unless Doctor.exists? last_name: "Jones"
  Doctor.create! first_name: "Jane",
    last_name: "Jones",
    speciality: "General Practice",
    contact_phone: "520-277-2222"
end
