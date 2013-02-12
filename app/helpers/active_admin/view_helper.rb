module ActiveAdmin::ViewHelper
  def new_measurement_link(product_id)
    link_to "Enter Measurement Data", new_admin_product_t_shirts_measurement_path(product_id)
  end
end