# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password "foobar"
    password_confirmation "foobar"
    gender "female"

    factory :male do
      gender "male"
    end

    factory :female do
      gender "female"
    end
  end
end
