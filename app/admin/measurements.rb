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
        original = Measurement.find(params[:measurement_id])
        @measurement = @product.measurement_class.constantize.new(product_id: params[:product_id], size: original.size, position: original.position)
      else
        group = @product.measurement_groups.new
        @measurement = group.new_measurement
      end

      new!
      # Instance method
    end

    def create
      @product = Product.find(params[:product_id])
      @measurement = @product.measurement_class.constantize.new(params[:measurement], admin_user_id: current_admin_user.id)
      create!
      # Instance method
    end


  end





  form do |f|



    f.inputs "Data" do
      f.input :size
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
