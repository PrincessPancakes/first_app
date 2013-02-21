require_relative '../../app/services/spec_data_input_engine'
require_relative '../spec_helper_lite'
require 'ostruct'

describe SpecDataInputEngine do

  #stub_class Measurement


  subject{ SpecDataInputEngine.new }
  let(:data_sink){OpenStruct.new({larger_size: nil, smaller_size: nil})}
  let(:measurement){measurement = Object.new}

  describe "No existing measurement for that size" do
    it "creates a single measurement with unverified status" do
      params = {product_id: 3, size_id: 4}
      subject.data_sink = data_sink

      stub(measurement).smaller_size{nil}
      stub(measurement).larger_size{nil}

      stub(data_sink).new(params){measurement}
      stub(measurement).save!{measurement}
      stub(data_sink).by_product_and_size(3,4) {nil}

      dont_allow(measurement).verify

      subject.create(params)
    end
  end


  describe "Verifying data input" do
    it "verifies a matching entry" do
      params = {product_id: 3, size_id: 4}
      subject.data_sink = data_sink

      other = OpenStruct.new(a: 5, b: 6)
      measurement = OpenStruct.new(larger_size: nil, smaller_size: nil, points: [:a, :b], a: 5, b: 6)

      stub(measurement).save!{measurement}
      stub(other).save!{other}

      stub(data_sink).new(params){measurement}
      stub(data_sink).by_product_and_size(3,4) {other}

      mock(other).verify
      mock(measurement).verify

      subject.create(params)
    end

    #it "flags an incorrect entry" do
    #  params = {product_id: 3, size_id: 4, a: 5, b: 6}
    #  other = OpenStruct.new(a: 3.6, b: 6)
    #  measurement = OpenStruct.new(points: [:a, :b], a: 5, b: 6, smaller_size: nil, larger_size: nil)
    #
    #
    #
    #  Measurement.should_receive(:new).and_return(measurement)
    #  other.should_receive(:save!)
    #  measurement.should_receive(:save!).and_return(measurement)
    #  Measurement.should_receive(:by_product_and_size).with(3,4).and_return(other)
    #
    #  measurement.should_receive(:flag_point).with(:a)
    #  other.should_receive(:flag_point).with(:a)
    #  measurement.should_not_receive(:flag_point).with(:b)
    #  other.should_not_receive(:flag_point).with(:b)
    #
    #  measurement.should_receive(:flag_product)
    #
    #  measurement = SpecDataInputEngine.create(params)
    #end

  end


  #context "Sequence flagging" do
  #  it "flags a sequencing error when a smaller size has a larger measure" do
  #    params = {product_id: 3, size_id: 4, a: 5, b: 6}
  #    smaller = double("Measurement", points: [:a, :b], a: 3, b: 5)
  #    measurement = double("Measurement", points: [:a, :b], a: 4, b: 6)
  #    larger = double("Measurement", points: [:a, :b], a: 5, b: 5)
  #
  #
  #    Measurement.should_receive(:new).and_return(measurement)
  #    measurement.should_receive(:save!).and_return(measurement)
  #    Measurement.should_receive(:by_product_and_size).with(3,4).and_return(nil)
  #
  #    measurement.should_receive(:larger_size).and_return(larger)
  #    measurement.should_receive(:smaller_size).and_return(smaller)
  #
  #    larger.should_receive(:flag_sequence).with(:b)
  #    measurement.should_receive(:flag_product)
  #
  #    SpecDataInputEngine.create(params)
  #
  #  end
  #
  #  it "flags a sequencing error when a larger size has a smaller measure" do
  #
  #  end
  #end






end