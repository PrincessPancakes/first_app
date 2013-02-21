require 'spec_helper'

describe "Admin::InputMeasurementData" do
  describe "product details input" do
    it "inputs a t-shirt" do
      brand = create(:brand)
      category = create(:t_shirts)
      admin = create(:admin)


      visit new_admin_user_session_path
      fill_in("Email", with: admin.email)
      fill_in("Password", with: admin.password)
      click_button "Login"
    end
  end
end
