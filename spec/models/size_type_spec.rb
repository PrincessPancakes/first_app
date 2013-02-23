require_relative '../../app/models/size_type'
require_relative '../spec_helper_nulldb'


describe SizeType do
  describe "#get_from_options" do
    it "returns alpha for XS etc." do


      options = %w(XS S M L)

      SizeType.get_from_options.should == alpha
    end
  end
end
