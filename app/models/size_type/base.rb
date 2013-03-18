class SizeType::Base
  def self.options
    raise "options need to be implemented by subclass"
  end

  def self.get_from_options(options)
    if options.include?("XL") || options.include?("M")  || options.include?("SMALL")
      return SizeType::Alpha
    elsif options.include?("4") || options.include?("8")
      return SizeType::WomenNumeric
    elsif options.include?("32") || options.include?("36")
      return SizeType::MenPants1D
    elsif options.include?("32x32") || options.include?("32x34")
      return SizeType::MenPants2D
    else
      return options
    end
  end

  def self.smaller_size(size)
    options[index - 1] if has_smaller_size?(size)
  end

  def self.has_smaller_size?(size)
    index = options.index(size)
    index.present? && index >= 1
  end

  def self.larger_size(size)
    options[index + 1] if has_larger_size?(size)
  end

  def self.has_larger_size?(size)
    index = options.index(size)
    index.present? && index < options.length - 1
  end
end