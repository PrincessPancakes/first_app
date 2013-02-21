# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :size do
    association :size_type
    value "M"
    position 1

    factory :small do
      value "S"
      position 10
    end

    factory :medium do
      value "M"
      position 20
    end

    factory :large do
      value "L"
      position 30
    end
  end
end
