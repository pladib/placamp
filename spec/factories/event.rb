FactoryGirl.define do
  factory :event do
    name "Develper conference"
    description "Developer conference description"
    start_datetime DateTime.now
    end_datetime 3.hours.ago
    maximum_quantity 3
  end
end
