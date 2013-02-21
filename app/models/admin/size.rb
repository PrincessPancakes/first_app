class Admin::Size < ActiveRecord::Base
  belongs_to :product
  belongs_to :admin_user
  belongs_to :measurement, polymorphic: true
  attr_accessible :measurement_id, :measurement_type, :size
end
