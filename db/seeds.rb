# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

## To re-build DB run ##
# $ rails db:drop
# $ rails db:migrate
# $ rails db:seed


## User Data ##
unless User.exists? email: "patient@boc.com"
  User.create! email: "patient@boc.com", password: "password"
end
