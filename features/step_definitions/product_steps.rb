Given /^I visit a product page for a "([^"]*)"$/ do |arg1|
  @t_shirt = build_stubbed(:gap_t_shirt)
  visit admin_product_path(@t_shirt)
end



Given /^I enter valid "([^"]*)" measurement data$/ do |arg1|
  #click_link "Enter Measurement Data"
  visit new_admin_measurement_path(type: @t_shirt.measurement_class)
  data = attributes_for(:s_t_shirt)
  @t_shirt.points.each do |point|
    fill_in(point, with: data[point])
  end
end
