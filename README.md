
# Better on Call

## Setup
  * bundle install
  * rails db:migrate
  * rails db:seed
  * rspec
  * rails s

### Google maps

  * Using https://github.com/laserlemon/figaro for app configuration

  ** To run locally must have a 'config/application.yml'; with the following:
    ```ruby
    google_js_api_key: "AIzaSyAAEQWftcE3JxCc1M6tx0odTN6vplqg5Jw"
    ```


## MVP features

1. Doctor view
  * Registering doctors
    * doctor insurance
    * how do doctor's get vetted, verify status
  * Viewing patients Electronic Health Records (EHR)- MVP
  * Communicating with patients - MVP
  * Viewing account - MVP
  * Location and schedule preferences - MVP
2. Patient view
  * Registering patients - MVP
    * Fee for service (via paypal)- MVP
    * patient location & preferences - MVP
    * Health records release - MVP
    * Treatment release - MVP
    * patient vetting
  * Listing doctors
  * Showing a doctor
  * Appointment
    * Scheduling
    * Uber model - MVP
  * Rating a doctors - MVP
  * Viewing account - MVP
  * [Search for doctor's in area] (https://github.com/parametertechnologies/boc/issues/3) - MVP 
3. Admin view
  * Batch doctor registration

## User Stories
1. Single people who are busy
2. Families..people with children
  * registering children and dealing w/ their EHR
3. Older folks who can not get to doctor easily
