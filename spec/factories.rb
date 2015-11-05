FactoryGirl.define do
  factory :vehicle do
    year 2008
    make "BMW"
    model "M3"
    vin "WBSWD93558PY39440"
  end

  factory :service_record do
    association :vehicle
    subject "Oil Change"
    mileage 23_000.1
  end
end
