FactoryGirl.define do
  factory :vehicle do
    association :owner, factory: :user
    year 2008
    make "BMW"
    model "M3"
    vin "WBSWD93558PY39440"
    mileage 69_832.3
  end

  factory :service_record do
    association :vehicle
    subject "Oil Change"
    mileage 23_000.1
    performed_on 100.days.ago
  end

  factory :user do
    email "someone@something.com"
    password "this_is_my_pass"
  end
end
