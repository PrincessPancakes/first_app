class Measurement < ActiveRecord::Base
  belongs_to :product
  belongs_to :admin_user
  attr_accessible :product_id, :admin_user_id, :size, :status, :position,
                  :waist, :hips, :front_rise, :back_rise, :thigh,
                  :inseam, :outseam, :opening, :hps_length, :cb_length, :chest, :sleeve_width,
                  :shoulder, :arm_hole, :sleeve_length, :cuff, :collar, :knee

  #accepts_nested_attributes_for :measurement

  def self.points
    raise NotImplementedError "Subclass needs to implement points class method"
  end

  def points
    raise NotImplementedError "Subclass needs to implement points class method"
  end

end
