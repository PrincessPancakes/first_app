require 'spec_helper'

describe Product do
  describe "Model setup" do
    it { should validate_presence_of(:brand_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:identifier) }

    it { should_not allow_value("bad").for(:gender) }
    it { should allow_value("men").for(:gender) }
    it { should allow_value("women").for(:gender) }
    it { should allow_value("unisex").for(:gender) }

    it { should belong_to(:category) }
    it { should belong_to(:brand) }

    #it { should have_many(:styles) }
    #it { should have_many(:measurements) }
    #it { should have_many(:items) }
    #it { should have_many(:closet_items) }
    #it { should have_many(:clothing_pictures) }


  end
end
