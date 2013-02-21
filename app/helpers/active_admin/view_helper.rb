module ActiveAdmin::ViewHelper
  def new_measurement_link(product)
    link_to "Enter Measurement Data", new_admin_product_measurement_path(product.id, type: product.measurement_class, id: "enter-data-link")
  end
end