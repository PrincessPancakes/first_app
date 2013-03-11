Given /^I have a "([^"]*)" in my closet$/ do |product|
  product = build_stubbed(:gap_t_shirt)
  group = build_stubbed(:measurement_group, product: product)
  m = build_stubbed(:t_shirts_measurement, measurement_group: group)
  s = build_stubbed(:style, product: product)
  @item = build_stubbed(:item, measurement: m, style: s)

  @user.closet_items.create!(item: @item)
end

Given /^I visit my virtual closet$/ do
  visit user_closet_items_path(@user)
end

