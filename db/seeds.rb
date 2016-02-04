# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

## To re-build DB run ##
# $ rails db:drop
# $ rails db:migrate
# $ rails db:seed


## User Data ##
user = unless User.exists? email: "patient@boc.com"
         User.create! email: "patient@boc.com", password: "password"
       end

unless Patient.exists? first_name: "Kim"
  Patient.create! first_name: "Kim",
    last_name: "Smith",
    contact_phone: "928-277-7779",
    user: user
end

unless Patient.exists? first_name: "John"
  Patient.create! first_name: "John",
    last_name: "Smith",
    contact_phone: "928-277-7779",
    user: user
end

unless Patient.exists? first_name: "Kate"
  Patient.create! first_name: "Kate",
    last_name: "Smith",
    contact_phone: "928-277-7779",
    user: user
end
