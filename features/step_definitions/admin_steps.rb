Given /^there is an admin logged in$/ do
  admin = build_stubbed(:admin_user)
  visit new_admin_user_session_path
  fill_in(:email, with: admin.email)
  fill_in(:password, with: admin.password)
  click_button "Login"
end