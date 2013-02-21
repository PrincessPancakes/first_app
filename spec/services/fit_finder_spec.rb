require_relative '../../app/services/fit_finder'

describe FitFinder do
  it "creates an entry for everything with a match >= 90%" do
    options = [stub(match: 93), stub(match: 88)]

    finder = FitFinder.new(product)
  end

  it "retrieves only relevant items" do

  end

  it ""
end