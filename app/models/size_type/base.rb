class SizeType::Base
  def options
    raise "options need to be implemented by subclass"
  end

  def self.get_from_options(options)
    if options.include?("XL")
      return SizeType::Alpha
    end
  end
end