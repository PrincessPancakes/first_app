class SizeType::Base
  def self.options
    raise "options need to be implemented by subclass"
  end

  def self.get_from_options(options)
    if options.include?("XL") || options.include?("M")
      return SizeType::Alpha
    elsif options.include?("4") || options.include?("8")
      return SizeType::WomenNumeric
    elsif options.include?("32") || options.include?("36")
      return SizeType::MenPants1D
    elsif options.include?("32x32") || options.include?("32x34")
      return SizeType::MenPants2D
    end
  end

  def self.smaller_size(size)
    index = options.index(size)
    if index.present? && index >= 1
      return options[index - 1]
    end
    nil
  end

  def self.larger_size(size)
    index = options.index(size)
    if index.present? && index < options.length - 1
      return options[index + 1]
    end
    nil
  end
end