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
      row :tags
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
            row :content
            row :image_url
            #row :picture do
            #  image_tag style.image.image_url(:grid)
            #
            #end
          end
        end
      end
    end


    measurements = product.measurements.group_by{|m| m.size}
    measurements.each do |size, measurements|
      div do
        panel("Measurements for Size #{size} - #{measurements.first.status}") do
          measurements.each do |measurement|
            attributes_table_for(measurement) do
              #row :admin_user
              row :created_at
              product.points.each do |m|
                row m.to_sym
              end
            end
            if measurements.length == 1
              div do
                link_to "Verify Measurements", new_admin_product_measurement_path(product.id, measurement_id: measurement.id)
              end
            end
          end


        end
      end
    end

    panel("actions") do
      new_measurement_link(product)
    end

    active_admin_comments
  end

end
