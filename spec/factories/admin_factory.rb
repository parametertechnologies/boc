FactoryGirl.define do
  factory :admin, class: User do
    sequence(:email) { |n| "test_admin#{n}@example.com" }
    password "password"
    admin true
  end
end
