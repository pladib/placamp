FactoryGirl.define do
  factory :user do
    name  "Jeep Kiddee"
    email "jeep@email.com"
    password "testP4$sword"

    factory :admin do
      name  "Jeep Admin"
      admin true
    end

  end

end
