class MeasurementCallbacks

  class << self

    def before_save(measurement)

      other = measurement.corresponding_entry
      if other.blank?
        puts "Other is blank - #{other.inspect}"
        measurement.status = "unverified"
      else
        if compare(measurement, other)
          puts "comparison branch"
          measurement.update_column("status", "verified")
          other.update_column("status", "verified")
          #check to see if the product is complete
        else
          measurement.update_column("status", "flagged")
          other.update_column("status", "flagged")
          #perform the comparison
          #verified
          #flagged
          #check to see if product is complete
        end

      end

    end

    private

    def compare(measurement, other)
      match = true
      measurement.points.each do |point|
        if point_difference(measurement, other, point) > 0.5
          flag_point(measurement, point)
          flag_point(other, point)
          match = false
        end
      end
      match
    end

    def point_difference(measurement, other, point)
      (measurement.send(point) - other.send(point)).abs
    end

    def flag_point(measurement, point)
      measurement.update_column(point, measurement.send(point) * -1)
    end
  end
end

