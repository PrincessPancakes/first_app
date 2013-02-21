require 'spec_helper'

describe MeasurementCallbacks do
  let(:brand){create(:brand)}
  let(:size){create(:size)}
  let(:t_shirts){create(:t_shirts)}
  let(:t_shirts_product){create(:product, brand: brand, category: t_shirts)}
  let(:measurement_group){create(:measurement_group, product: t_shirts_product)}
  let(:t_shirts_measurement){ build(:t_shirts_measurement, measurement_group: measurement_group, size: size) }

  it "sets status as unverified for a single entry" do
    m = t_shirts_measurement
    m.save!
    m.should be_unverified
  end

  it "sets status as verified for a matching entry" do
    m1 = t_shirts_measurement
    m1.save!

    m2 = create(:t_shirts_measurement, measurement_group: measurement_group, size: size)
    m1.reload

    m1.should be_verified
    m2.should be_verified
  end

  it "flags an incorrect entry" do
    m1 = t_shirts_measurement
    m1.save!
    m2 = create(:t_shirts_measurement, measurement_group: measurement_group, chest: m1.chest+2, size: size)
    m1.reload

    m1.should be_flagged
    m2.should be_flagged

    m1.point_flagged?(:chest).should be_true
    m1.product.should be_flagged
  end

  it "activates a product when all data is complete" do
    product = create(:product, brand: brand, category: t_shirts, sizes: 2)
    measurement_group = create(:measurement_group, product: product)


    m1 = create(:t_shirts_measurement, measurement_group: measurement_group, size: size)



    m2 = create(:t_shirts_measurement, measurement_group: measurement_group, size: size)

    m1.reload

    m1.should be_verified
    m2.should be_verified


    size = create(:size, position: 50, value: "XL")
    m3 = create(:t_shirts_measurement, measurement_group: measurement_group, size: size)
    m4 = create(:t_shirts_measurement, measurement_group: measurement_group, size: size)

    puts measurement_group.measurements.inspect

    m3.reload

    m3.should be_verified
    m4.should be_verified



    product.reload
    product.should be_active
  end

  it "flags a sequencing error in the input", focus: true do
    m1 = t_shirts_measurement
    m1.save!

    size = create(:size, position: 50, value: "XL")

    m2 = create(:t_shirts_measurement, measurement_group: measurement_group, waist: m1.waist-1, size_id: size.id)
    #m1.reload
    #
    #m1.should be_flagged
    #m2.should be_flagged
    #
    #puts SequenceFlag.all.inspect
    #
    #m1.measurement_group.point_flagged?(:waist).should be_true
    #m1.product.should be_flagged
  end
end



