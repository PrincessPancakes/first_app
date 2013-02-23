class SizeType::Alpha < SizeType::Base
  def self.options
    %w( XS S M L XL )
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