# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_size, :class => 'Admin::Size' do
    size "MyString"
    product nil
    admin_user nil
    measurement_id 1
    measurement_type "MyString"
  end
end
