FactoryGirl.define do
  factory :s_t_shirt, parent: :t_shirts_measurement do |m|
    m.chest 18
    m.waist 16
    m.opening 17
    m.cb_length 25
    m.hps_length 26
    m.sleeve_width 8
    m.shoulder 18
    m.arm_hole 10
    m.size {association(:small)}
  end

  factory :m_t_shirt, parent: :t_shirts_measurement do |m|
    m.chest 18
    m.waist 16
    m.opening 17
    m.cb_length 25
    m.hps_length 26
    m.sleeve_width 8
    m.shoulder 18
    m.arm_hole 10
    m.size {association(:medium)}
  end

  factory :l_t_shirt, parent: :t_shirts_measurement do |m|
    m.chest 18
    m.waist 16
    m.opening 17
    m.cb_length 25
    m.hps_length 26
    m.sleeve_width 8
    m.shoulder 18
    m.arm_hole 10
    m.size {association(:large)}
  end
end