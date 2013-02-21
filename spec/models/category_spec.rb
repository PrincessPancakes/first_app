require 'spec_helper'

describe Category do
  describe "Model setup" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:gender) }

    it { should_not allow_value("bad").for(:gender) }
    it { should allow_value("men").for(:gender) }
    it { should allow_value("women").for(:gender) }
    it { should allow_value("both").for(:gender) }

  end
end
