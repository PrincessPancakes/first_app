Given /^there is a male user logged in$/ do
  @user = create(:male)
  @user.confirm!
  visit new_user_session_path
  fill_in :email, with: @user.email
  fill_in :password, with: @user.password
  click_button "Sign in"
end