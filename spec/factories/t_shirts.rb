FactoryGirl.define do
  #factory :alpha, parent: :size_type do
  #  name "alpha"
  #
  #  after(:stub) do |alpha|
  #    build_stubbed(:small, size_type: alpha)
  #    build_stubbed(:medium, size_type: alpha)
  #    build_stubbed(:large, size_type: alpha)
  #  end
  #end

  factory :s_gap_t_shirt, parent: :product do |product|
    product.size_type { "SizeType::Alpha" }
    product.category { |p| p.association(:t_shirts) }
    product.brand { |p| p.association(:gap) }

    product.after(:stub) do |p|
      size = build_stubbed(:size, size_type: p.size_type, value: "S")
      group = build_stubbed(:measurement_group, product: p)
      build_stubbed(:s_t_shirt, measurement_group: group, size: size)
      #build_stubbed(:m_t_shirt, measurement_group: group)
      #m = build_stubbed(:l_t_shirt, measurement_group: group)
      #puts m.inspect
    end

  end

  factory :gap_t_shirt, parent: :product do |product|
    product.size_type "SizeType::Alpha"
    product.category { |p| p.association(:t_shirts) }
    product.brand { |p| p.association(:gap) }
  end

end