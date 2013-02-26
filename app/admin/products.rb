ActiveAdmin.register Product do
  scope :all, default: true
  scope :active
  scope :incomplete
  scope :unverified
  scope :flagged

  filter :identifier
  filter :gender
  filter :category
  filter :brand

  #collection_action :new, :method => :get do
  #  @size = Size.new
  #  @measurement = TShirtsMeasurement.new
  #  @size.measurement = @measurement
  #  puts @size.measurement
  #end

  index do
    column :identifier do |product|
      link_to product.identifier, admin_product_path(product)
    end
    column :gender
    column :category
    column :brand
    column :name do |product|
      link_to product.name, admin_product_path(product)
    end
    column :url do |product|
      link_to product.url, product.url
    end
    column :tags

    default_actions

  end
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

  form do |f|
    f.inputs "Product" do
      f.input :brand
      f.input :category
      f.input :gender, :as => :radio, :collection => Product::GENDER_OPTIONS
      f.input :identifier
      f.input :name
      f.input :url
      f.input :status, :as => :select, :collection => Product::STATUS_OPTIONS
      f.input :size_type, :as => :radio, :collection => SizeType::OPTIONS
      f.input :tags
    end

    f.buttons

  end

end
