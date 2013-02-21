# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    sequence(:name) {|n| "Product-#{n}" }
    gender "unisex"
    url "http://brandwebsite.com/url"
    association :brand
    association :category
    association :size_type
    identifier "identifier"
    status "incomplete"
  end
end
