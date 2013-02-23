ActiveAdmin.register Measurement do
  belongs_to :product


  member_action :verification do
    @product = Product.find(params[:product_id])
    @measurement = Measurement.find(params[:id])

    render :verification
    # This will render app/views/admin/posts/comments.html.erb
  end


  controller do
    # This code is evaluated within the controller class

    def new
      @product = Product.find(params[:product_id])
      if params[:measurement_id]
        @original = @product.measurement_class.constantize.find(params[:measurement_id])
        @measurement = @product.measurement_class.constantize.new(@original.points_hash)
      else
        group = @product.first_group
        @measurement = group.new_measurement
      end

      new!
      # Instance method
    end

    def create
      @product = Product.find(params[:product_id])
      #SpecDataInputEngine.new.create(params)
      #@measurement = @product.measurement_class.constantize.create!(params[:measurement], admin_user_id: current_admin_user.id)
      @measurement = SpecDataInputEngine.new.create(@product.id, params[:measurement])

      if @measurement
        redirect_to admin_product_path(@product)
      else
        render :new
      end
      # Instance method
    end


  end





  form do |f|



    f.inputs "Data" do
      f.input :size, :as => :radio, :collection => SizeType::Alpha.options
      #f.input :position

      link_to "testing", admin_root_path
      #f.input :type

      f.object.points.each do |point|
        f.input point
      end


      f.input :measurement_group
      #TShirtsMeasurement.points.each do |point|
      #  f.input point
      #end

    end
    f.buttons
  end



end
