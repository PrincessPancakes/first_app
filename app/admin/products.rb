ActiveAdmin.register Product do
  scope :all, default: true
  scope :active
  scope :incomplete
  scope :unverified
  scope :flagged

  #collection_action :new, :method => :get do
  #  @size = Size.new
  #  @measurement = TShirtsMeasurement.new
  #  @size.measurement = @measurement
  #  puts @size.measurement
  #end


  show do |product|
    attributes_table do
      row :status
      row :name
      row :gender
      row :brand
      row :category
      row :identifier
      row :url do
        link_to product.url, product.url
      end
      row :created_at
      row :updated_at
    end

    #attributes_table do |style|
    #  row :name
    #end

    product.styles.each do |style|
      div do
        panel("Style") do
          attributes_table_for(style) do
            row :description
            #row :picture do
            #  image_tag style.image.image_url(:grid)
            #
            #end
          end
        end
      end
    end



    product.measurements.each do |measurement|
      div do
        panel("Measurements for Size #{measurement.size}") do
          attributes_table_for(measurement) do
            TShirtsMeasurement.points.each do |m|
              row m.to_sym
            end

          end
        end
      end
    end

    panel("actions") do
      new_measurement_link(product.id)
    end

    active_admin_comments
  end

end
