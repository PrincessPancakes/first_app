FactoryGirl.define do
  factory :admin_user, aliases: [:admin] do
    email "test@example.com"
    password "password"
  end
end
