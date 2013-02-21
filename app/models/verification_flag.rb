class VerificationFlag < ActiveRecord::Base
  belongs_to :measurement
  attr_accessible :point
end
