FactoryGirl.define do
  factory :category do
    name "pants"
    gender "both"
  end

  factory :sweaters, parent: :category do
    name 'sweaters'
    gender 'both'
  end

  factory :jeans, parent: :category do
    name 'jeans'
    gender 'both'
  end

  factory :shorts, parent: :category do
    name 'shorts'
    gender 'both'
  end

  factory :t_shirts, parent: :category do
    name 't-shirts'
    gender 'both'
  end

  factory :dress_shirts, parent: :category do
    name 'dress shirts'
    gender 'men'
  end

  factory :pants, parent: :category do
    name 'pants'
    gender 'both'
  end

  factory :sleeveless, parent: :category do
    name 'sleeveless'
    gender 'both'
  end

  factory :sweatshirts, parent: :category do
    name 'sweatshirts'
    gender 'both'
  end

  factory :long_sleeve, parent: :category do
    name 'long sleeve'
    gender 'both'
  end



  factory :blouses, parent: :category do
    name 'blouses'
    gender 'women'
  end


end