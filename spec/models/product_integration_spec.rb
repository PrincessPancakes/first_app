require_relative 'spec_helper_full'

describe Product do
  include SpecHelpers

  before do
    setup_database
  end

  after do
    teardown_database
  end




end