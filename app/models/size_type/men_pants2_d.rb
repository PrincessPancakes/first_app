class SizeType::MenPants2D < SizeType::Base
  def self.options
    @@sizes ||= generate_options
  end

  private

  def self.generate_options
    result = []
    waists.each do |waist|
      lengths.each do |length|
        result.push "#{waist}x#{length}"
      end
    end
  end

  def self.waists
    %w( 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 )
  end

  def self.lengths
    %w( 30 32 34 )
  end
end