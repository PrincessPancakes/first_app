FactoryGirl.define do
  factory :measurement do
    association :measurement_group
    association :size
    status "unverified"
    #chest 14
    #waist 12
    #opening 15
    #cb_length 25
    #hps_length 26
    #sleeve_length 34
    #sleeve_Width 8
    #shoulder 18
    #arm_hole 10
    #front_rise "14"
    #back_rise "14"
    #hips "21"
    #thigh "12"
    #knee "9"
    #cuff "9.5"
    #inseam "32"
    #outseam "43"


    factory :sleeveless_measurement do
      product_id "1"
      position 1
      size "m"
      chest 14
      waist 12
      opening 15
      cb_length 25
      hps_length 26
      #sleeve_length 34
      #sleeve_Width 8
      #shoulder 18
      arm_hole 10
      #front_rise "14"
      #back_rise "14"
      #hips "21"
      #thigh "12"
      #knee "9"
      #cuff "9.5"
      #inseam "32"
      #outseam "43"
    end
    factory :t_shirts_measurement, :class => 'TShirtsMeasurement' do
      chest 18
      waist 16
      opening 17
      cb_length 25
      hps_length 26
      #sleeve_length 34
      sleeve_width 8
      shoulder 18
      arm_hole 10
      #front_rise "14"
      #back_rise "14"
      #hips "21"
      #thigh "12"
      #knee "9"
      #cuff "9.5"
      #inseam "32"
      #outseam "43"
    end
    factory :pants_measurement do
      product {association(:product) }
      position 1
      size "m"
      #chest 14
      waist 12
      #opening 15
      #cb_length 25
      #hps_length 26
      #sleeve_length 34
      #sleeve_Width 8
      #shoulder 18
      #arm_hole 10
      front_rise "14"
      back_rise "14"
      hips "21"
      thigh "12"
      knee "9"
      cuff "9.5"
      inseam "32"
      outseam "43"
    end
    factory :long_sleeve_measurement do
      product_id "1"
      position 1
      size "m"
      chest 14
      waist 12
      opening 15
      cb_length 25
      hps_length 26
      sleeve_length 34
      sleeve_Width 8
      shoulder 18
      arm_hole 10
      #front_rise "14"
      #back_rise "14"
      #hips "21"
      #thigh "12"
      #knee "9"
      cuff "9.5"
      #inseam "32"
      #outseam "43"
    end
    factory :shorts_measurement do
      product_id "1"
      position 1
      size "m"
      #chest 14
      waist 12
      #opening 15
      #cb_length 25
      #hps_length 26
      #sleeve_length 34
      #sleeve_Width 8
      #shoulder 18
      #arm_hole 10
      front_rise "14"
      back_rise "14"
      hips "21"
      thigh "12"
      knee "9"
      cuff "9.5"
      inseam "32"
      outseam "43"
    end
    factory :dress_shirts_measurement do
      product_id "1"
      position 1
      size "m"
      chest 14
      collar 14
      waist 12
      opening 15
      cb_length 25
      hps_length 26
      sleeve_length 34
      sleeve_Width 8
      shoulder 18
      arm_hole 10
      #front_rise "14"
      #back_rise "14"
      #hips "21"
      #thigh "12"
      #knee "9"
      cuff "9.5"
      #inseam "32"
      #outseam "43"
    end




    #product { FactoryGirl::Singleton.execute(:product) }
    #position
    #size
    #chest
    #waist
    #opening
    #cb_length
    #hps_length
    #shoulder
    #arm_hole
  end
end

