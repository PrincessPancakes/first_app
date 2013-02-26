class SpecDataInputEngine

  attr_writer :data_sink

  def create(product_id, params)
    @product = Product.find(product_id)

    @measurement = data_sink.new(params.merge({status: "unverified"}))
    @other = data_sink.by_product_and_size(product_id, params[:size])

    #unless @other.nil?
    #  if compare
    #    @other.verify
    #    @measurement.verify
    #  else
    #    @measurement.flag_product
    #  end
    #  @other.save!
    #end
    #
    #unless valid_sequence?
    #  @measurement.flag_product
    #end

    @measurement.save!
  end

  private

  def compare
    match = true
    @measurement.points.each do |point|
      if point_difference(point) > 0.5
        @measurement.flag_point(point)
        @other.flag_point(point)
        match = false
      end
    end
    match
  end

  def point_difference(point)
    (@measurement.send(point) - @other.send(point)).abs
  end

  def valid_sequence?
    smaller = @measurement.smaller_size
    larger = @measurement.larger_size



    valid = true
    unless smaller.nil?
      valid = compare_sequence(smaller, @measurement)
    end
    if valid
      unless larger.nil?
        valid = compare_sequence(@measurement, larger)
      end
    end

    valid
  end

  def compare_sequence(smaller, larger)
    valid = true
    larger.points.each do |point|
      #puts "#{point}: #{larger.send(point) } < #{smaller.send(point)} ???"
      if larger.send(point) < smaller.send(point)
        valid = false
        larger.flag_sequence(point)
      end
    end
    valid
  end

  private

  def new(*args)
    data_sink.new(*args)
  end

  def find_other(product_id, size_id)
    data_sink.by_product_and_size(product_id, :size)
  end

  def data_sink
    @data_sink ||= @product.measurement_class.constantize
  end

end