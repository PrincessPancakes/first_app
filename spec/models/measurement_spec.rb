require 'spec_helper'

describe Measurement do

  let(:brand){create(:brand)}
  let(:size){create(:size)}
  let(:t_shirts){create(:t_shirts)}
  let(:t_shirts_product){create(:product, brand: brand, category: t_shirts)}
  let(:measurement_group){create(:measurement_group, product: t_shirts_product)}
  let(:t_shirts_measurement){ build(:t_shirts_measurement, measurement_group: measurement_group, size: size) }


  it "should flag a sequence" do
    m = create(:measurement)
    m.flag_sequence(:chest)
  end

  describe "#corresponding_entry" do
    it "finds the right entry when it exists" do

    end
  end

  def t_shirt_measurement
    brand = build(:brand)
    size = build(:size)
    t_shirts = build(:t_shirts)

  end

end
